resource "aws_route53_record" "cmcloudlab_cert_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.cmcloudlab_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
}

# resource "aws_route53_record" "route_domain_to_s3" {
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = var.domain_name
#   type    = "A"
#   alias {
#     name                   = aws_lb.alb.dns_name
#     zone_id                = aws_lb.alb.zone_id
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_record" "route_domain_to_alb" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "alb.${var.domain_name}"
  type    = "A"
  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_domain_to_nlb" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "nlb.${var.domain_name}"
  type    = "A"
  alias {
    name                   = aws_lb.nlb.dns_name
    zone_id                = aws_lb.nlb.zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "s3_record" {
#   name = var.domain_name
#   zone_id = data.aws_route53_zone.zone.id
#   type    = "A"
#   alias {
#     name                   = aws_s3_bucket.static-website.website_domain
#     zone_id                = aws_s3_bucket.static-website.hosted_zone_id
#     evaluate_target_health = false
#   }
# }