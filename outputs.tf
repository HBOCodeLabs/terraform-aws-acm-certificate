output "acm_certificate_arn" {
  description = "arn of acm certificate"
  value       = "${aws_acm_certificate.this.arn}"
}

output "acm_certificate_dns_validation_record" {
  description = "record which is used to validate acm certificate"
  value       = "${aws_route53_record.this_sandbox.name}"
}

output "acm_certificate_dns_validation_record_nonprod" {
  description = "record which is used to validate acm certificate"
  value       = "${aws_route53_record.this_nonprod.name}"
}

output "acm_certificate_domain_name" {
  description = "the domain name of the certificate"
  value       = "${aws_acm_certificate.this.domain_name}"
}
