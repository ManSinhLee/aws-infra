resource "aws_acm_certificate" "cmcloudlab_cert" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cmcloudlab_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cmcloudlab_cert_validation_record : record.fqdn]
}