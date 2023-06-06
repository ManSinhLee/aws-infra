resource "aws_eip" "cmcloudlab_nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.cmcloudlab_igw]
}