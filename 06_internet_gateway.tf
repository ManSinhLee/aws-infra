resource "aws_internet_gateway" "cmcloudlab_igw" {
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  tags = {
    "Name" = "cmcloudlab_igw"
  }
}