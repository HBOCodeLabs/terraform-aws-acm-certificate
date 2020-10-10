output "acm_certificate_arn" {
  value = module.acm_cert.acm_certificate_arn
}

output "acm_certificate_dns_validation_record" {
  value = module.acm_cert.acm_certificate_dns_validation_records
}

output "acm_cert_domain_name" {
  value = module.acm_cert.acm_certificate_domain_name
}
