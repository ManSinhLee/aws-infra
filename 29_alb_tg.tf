resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cmcloudlab_vpc.id
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/index.html"
    port = 80
  }
  tags = {
    "Name" = "alb-tg"
  }
}