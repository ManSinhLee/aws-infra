resource "aws_autoscaling_policy" "alb_asp" {
  name                   = "alb_autoscaling_policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 1
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.alb_asc.name
}