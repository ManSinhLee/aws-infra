resource "aws_autoscaling_policy" "nlb_asp" {
  name                   = "nlb_autoscaling_policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 1
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.nlb_asc.name
}