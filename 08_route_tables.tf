resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  route {
    cidr_block = var.internet
    gateway_id = aws_internet_gateway.cmcloudlab_igw.id
  }
  tags = {
    "Name" = "public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  route {
    cidr_block = var.internet
    gateway_id = aws_nat_gateway.cmcloudlab_nat_gateway.id
  }
  tags = {
    "Name" = "private_route_table"
  }
}

resource "aws_route_table" "database_route_table" {
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  route {
    cidr_block = var.internet
    gateway_id = aws_nat_gateway.cmcloudlab_nat_gateway.id
  }
  tags = {
    "Name" = "database_route_table"
  }
}