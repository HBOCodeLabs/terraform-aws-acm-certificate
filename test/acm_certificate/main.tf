module "acm_cert" {
  source            = "./../.."

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.service}"
  project           = "${var.project}"

  certificate_name          = "${var.certificate_name}" 
  domain_name_sandbox       = "${var.domain_name_sandbox}"

  subject_alternative_names_sandbox = var.subject_alternative_names_sandbox
  subject_alternative_names_nonprod = var.subject_alternative_names_nonprod

  enable_validation = "${var.enable_validation}"

  providers = {

    aws.dns            = "aws"
    aws.dns-nonprod    = "aws.nonprod_us-east-1"
    #aws.dns-production = "aws.prod_us-east-1"
    ##aws.dns-management = "aws.mgmt_us-east-1"
    #aws.dns-hbogo      = "aws.hbogo_us-east-1"
    #aws.dns-sandbox    = "aws.sandbox_us-east-1"
  }
}
