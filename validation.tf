resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn         = aws_acm_certificate.this.arn

  validation_record_fqdns = concat(
    aws_route53_record.core_zone.*.fqdn,
    aws_route53_record.mgmt_zones.*.fqdn,
    aws_route53_record.nonprod_zones.*.fqdn,
    aws_route53_record.sandbox_zones.*.fqdn,
    aws_route53_record.hbogo_zones.*.fqdn,
    aws_route53_record.production_zones.*.fqdn
    )

  count = var.enable_validation ? 1 : 0
}
