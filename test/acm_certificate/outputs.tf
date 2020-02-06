#output "acm_certificate_arn" {
#  value = "${module.acm_cert.acm_certificate_arn}"
#}
#
##output "acm_certificate_dns_validation_record" {
##  value = "${module.acm_cert.acm_certificate_dns_validation_record}"
##}
#
###DEBUG
##output "acm_certificate_domain" {
##  value = "${module.acm_cert.acm_certificate_domain}"
##}
#
##output "aws_route53_record" {
##  value = "${module.acm_cert.aws_route53_record}"
##}
#
#
output "domain_validation_options" {
  value = "${module.acm_cert.domain_validation_options}"
}

#DEBUG
output "aws_route53_record_sandbox" {
  value       = "${module.acm_cert.aws_route53_record_sandbox}"
}

##DEBUG
#output "aws_route53_record_nonprod" {
#  value       = "${module.acm_cert.aws_route53_record_nonprod}"
#}
##DEBUG
#output "concat_aws_route53_records" {
#  value       = module.acm_cert.concat_aws_route53_records
#  #value       = values(module.acm_cert.concat_aws_route53_records)[*].fqdn
#}
###DEBUG
##output "local_sandbox_provider" {
##  value       = jsonencode(module.acm_cert.local_sandbox_provider)
##}
#
##DEBUG
#output "external_zone_mapping_sandbox" {
#  value = module.acm_cert.external_zone_mapping_sandbox
#}
#
##DEBUG
#output "external_zone_mapping_nonprod" {
#  value = module.acm_cert.external_zone_mapping_nonprod
#}
##DEBUG
#output "convert_to_output_we_can_use" {
#  #value = [for domain in module.acm_cert.external_zone_mapping_sandbox: length(jsondecode(domain))]
#  #value = [for domain in module.acm_cert.external_zone_mapping_sandbox: domain]
#  value = module.acm_cert.external_zone_mapping_sandbox
#}
##DEBUG
#output "strip_subdomain_to_get_zone_sandbox" {
#  value = module.acm_cert.strip_subdomain_to_get_zone_sandbox
#}
#DEBUG
output "aws_route53_zone_sandbox" {
  value = module.acm_cert.aws_route53_zone_sandbox
}
#DEBUG
output "domain_to_zone_mapping" {
  value = module.acm_cert.domain_to_zone_mapping
}
#DEBUG
output "debug" {
  value = module.acm_cert.debug
}
