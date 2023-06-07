resource "aws_autoscaling_group" "alb_asc" {
  min_size            = 0
  max_size            = 6
  desired_capacity    = 0
  vpc_zone_identifier = aws_subnet.private_subnet.*.id
  target_group_arns   = ["${aws_lb_target_group.alb_tg.arn}"]
  launch_template {
    id      = aws_launch_template.cmcloudlab-lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "alb_asc"
    propagate_at_launch = true
  }
}