#output "acm_certificate_arn" {
#  description = "arn of acm certificate"
#  value       = "${aws_acm_certificate.this.arn}"
#}
#
##output "acm_certificate_dns_validation_record" {
##  description = "record which is used to validate acm certificate"
##  value       = "${aws_route53_record.this.name}"
##}
#
##output "acm_certificate_dns_validation_record_nonprod" {
##  description = "record which is used to validate acm certificate"
##  value       = "${aws_route53_record.this_nonprod.name}"
##}
#
#output "acm_certificate_domain_name" {
#  description = "the domain name of the certificate"
#  value       = "${aws_acm_certificate.this.domain_name}"
#}
#
##output "aws_route53_record" {
##  value       = "${module.san_verification.aws_route53_record}"
##}
##
#
output "domain_validation_options" {
  value = "${aws_acm_certificate.this.domain_validation_options}"
}

#DEBUG
output "aws_route53_record_sandbox" {
  value       = "${module.san_verification.aws_route53_record_sandbox}"
}
##DEBUG
#output "aws_route53_record_nonprod" {
#  value       = "${module.san_verification.aws_route53_record_nonprod}"
#}
#
##DEBUG
#output "concat_aws_route53_records" {
#  value = "${module.san_verification.concat_aws_route53_records}"
#}
#
###DEBUG 
##output "local_sandbox_provider" {
##  value = module.san_verification.local_sandbox_provider
##}
#
##DEBUG
#output "external_zone_mapping_sandbox" {
#  value = module.san_verification.external_zone_mapping_sandbox
#}
#
##DEBUG
#output "external_zone_mapping_nonprod" {
#  value = module.san_verification.external_zone_mapping_nonprod
#}
##DEBUG
#output "strip_subdomain_to_get_zone_sandbox" {
#  value = module.san_verification.strip_subdomain_to_get_zone_sandbox
#}
#DEBUG
output "aws_route53_zone_sandbox" {
  value = module.san_verification.aws_route53_zone_sandbox
}
#DEBUG
output "domain_to_zone_mapping" {
  value = module.san_verification.domain_to_zone_mapping
}

#DEBUG
output "debug" {
  value = module.san_verification.debug
}
