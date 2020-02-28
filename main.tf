resource "aws_acm_certificate" "this" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"

  subject_alternative_names = "${concat(
    var.subject_alternative_names_mgmt,
    var.subject_alternative_names_nonprod,
    var.subject_alternative_names_hbogo,
    var.subject_alternative_names_sandbox
  )}"

  tags = {
    Name                      = "${var.certificate_name}"
    name                      = "${var.certificate_name}"
    environment               = "${var.environment}"
    cluster                   = "${var.cluster}"
    service                   = "${var.service}"
    project                   = "${var.project}"
    managed_by                = "terraform"
  }
}
