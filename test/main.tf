module "acm_cert" {
  source            = "./.."

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.service}"
  project           = "${var.project}"

  certificate_name          = "${var.certificate_name}" 
  domain_name               = "${var.domain_name}"

  subject_alternative_names_sandbox = "${var.subject_alternative_names_sandbox}"

  hosted_zone_name          = "${var.hosted_zone_name}"
  hosted_zone_names_sandbox    = "${var.hosted_zone_names_sandbox}"

  enable_validation = "${var.enable_validation}"

  providers = {
    aws.dns = "aws"
    aws.mgmt = "aws"
    aws.nonprod = "aws"
    aws.sandbox = "aws"
    aws.hbogo = "aws"
  }
}
