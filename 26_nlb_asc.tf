resource "aws_autoscaling_group" "nlb_asc" {
  min_size            = 3
  max_size            = 6
  desired_capacity    = 3
  vpc_zone_identifier = aws_subnet.private_subnet.*.id
  target_group_arns   = ["${aws_lb_target_group.nlb_tg.arn}"]
  launch_template {
    id      = aws_launch_template.cmcloudlab-lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "nlb_asc"
    propagate_at_launch = true
  }
}