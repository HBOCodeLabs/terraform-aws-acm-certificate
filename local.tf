locals {
  core_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if x.domain_name == var.domain_name]

  mgmt_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if contains(var.subject_alternative_names_mgmt, x.domain_name)]
  nonprod_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if contains(var.subject_alternative_names_nonprod, x.domain_name)]
  sandbox_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if contains(var.subject_alternative_names_sandbox, x.domain_name)]
  hbogo_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if contains(var.subject_alternative_names_hbogo, x.domain_name)]
  production_validation = [for x in aws_acm_certificate.this.domain_validation_options: x if contains(var.subject_alternative_names_production, x.domain_name)]
}
