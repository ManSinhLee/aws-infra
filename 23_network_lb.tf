resource "aws_lb" "nlb" {
  name                             = "nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = aws_subnet.public_subnet.*.id
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  enable_deletion_protection       = false
  tags = {
    "Name" = "nlb"
  }
}