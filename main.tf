resource "aws_acm_certificate" "this" {
  domain_name       = "${var.domain_name_sandbox}"

  subject_alternative_names = concat(var.subject_alternative_names_sandbox,
                                     var.subject_alternative_names_nonprod,
                                     var.subject_alternative_names_production,
                                     var.subject_alternative_names_hbogo,
                                     var.subject_alternative_names_management
                                    )

  validation_method = "DNS"

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

module "san_verification" {
  source = "/Users/echerno/github/terraform-aws-acm-verification"

  route53_iterations = length(var.subject_alternative_names) + 1
  acm_certificate_arn = "${aws_acm_certificate.this.arn}"
  domain_validation_options = "${aws_acm_certificate.this.domain_validation_options}"

  domain_name_sandbox = var.domain_name_sandbox
  domain_name_nonprod = var.domain_name_nonprod
  subject_alternative_names_sandbox = var.subject_alternative_names_sandbox
  subject_alternative_names_nonprod = var.subject_alternative_names_nonprod

  providers = {
    aws.dns-sandbox    = "aws.dns"
    aws.dns-nonprod    = "aws.dns-nonprod"
    aws.dns-production = "aws.dns-production"
    aws.dns-management = "aws.dns-management"
    aws.dns-hbogo      = "aws.dns-hbogo"
  }
}
