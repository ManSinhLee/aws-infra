resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    type             = "forward"
  }
  tags = {
    "Name" = "http-listener"
  }
}

# resource "aws_lb_listener" "https_listener" {
#   load_balancer_arn = aws_lb.alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.cmcloudlab_cert.arn
#   default_action {
#     target_group_arn = aws_lb_target_group.alb_tg.arn
#     type             = "forward"
#   }
#   tags = {
#     "Name" = "https-listener"
#   }
# }