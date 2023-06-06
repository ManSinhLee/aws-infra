output "count" {
  value = length(data.aws_availability_zones.available.names)
}

output "alb_name" {
  value = aws_lb.alb.dns_name
}

output "nlb_name" {
  value = aws_lb.nlb.dns_name
}
