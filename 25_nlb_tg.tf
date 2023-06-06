resource "aws_lb_target_group" "nlb_tg" {
  name                 = "nlb-target-group"
  port                 = 80
  protocol             = "TCP"
  vpc_id               = aws_vpc.cmcloudlab_vpc.id
  target_type          = "instance"
  deregistration_delay = 90
  health_check {
    interval            = 30
    port                = 80
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}