resource "aws_vpc" "cmcloudlab_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "cmcloudlab_vpc"
  }
}