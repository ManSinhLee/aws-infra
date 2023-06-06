resource "aws_nat_gateway" "cmcloudlab_nat_gateway" {
  allocation_id = aws_eip.cmcloudlab_nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    "Name" = "cmcloudlab_nat_gateway"
  }
  depends_on = [aws_internet_gateway.cmcloudlab_igw]
}