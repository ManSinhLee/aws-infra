# > regex("\\d+\\.\\d+", "10.0.0.0/16")
# "10.0"
# > regex("\\d+\\.\\d+", "172.31.0.0/16")
# "172.31"
# > regex("\\d+\\.\\d+", "192.168.0.0/16")
# "192.168"

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.cmcloudlab_vpc.id
  cidr_block              = "${regex("\\d+\\.\\d+", var.vpc_cidr_block)}.${count.index}.0/24"
  map_public_ip_on_launch = true
  count                   = length(data.aws_availability_zones.available.names)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index - 3)
  tags = {
    Name = "public-subnet-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.cmcloudlab_vpc.id
  cidr_block              = "${regex("\\d+\\.\\d+", var.vpc_cidr_block)}.${length(data.aws_availability_zones.available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  count                   = length(data.aws_availability_zones.available.names - 3)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "private-subnet-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}

resource "aws_subnet" "database_subnet" {
  vpc_id                  = aws_vpc.cmcloudlab_vpc.id
  cidr_block              = "${regex("\\d+\\.\\d+", var.vpc_cidr_block)}.${2 * length(data.aws_availability_zones.available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  count                   = length(data.aws_availability_zones.available.names - 3)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "database-subnet-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}