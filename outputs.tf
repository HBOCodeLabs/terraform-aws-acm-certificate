## Certificate outputs
output "acm_certificate_arn" {
  description   = "arn of acm certificate"
  value         = aws_acm_certificate.this.arn
}


output "acm_certificate_domain_name" {
  description   = "domain name of acm certificate"
  value         = aws_acm_certificate.this.domain_name
}


### Validation outputs
output "acm_certificate_dns_validation_records" {
  description = "record which is used to validate acm certificate"
  value       = concat(
    list(aws_route53_record.core_zone[each.key].fqdn),
    aws_route53_record.mgmt_zones.*.fqdn,
    aws_route53_record.nonprod_zones.*.fqdn,
    aws_route53_record.sandbox_zones.*.fqdn,
    aws_route53_record.hbogo_zones.*.fqdn,
    aws_route53_record.production_zones.*.fqdn
    )
}
