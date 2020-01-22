module "acm_cert" {
  source            = "./../.."

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.service}"
  project           = "${var.project}"

  certificate_name          = "${var.certificate_name}" 
  domain_name               = "${var.domain_name}"
  subject_alternative_names = "${var.subject_alternative_names}"

  subject_alternative_names_nonprod = "${var.subject_alternative_names_nonprod}"
  
  hosted_zone_id            = "${var.hosted_zone_id}"
  hosted_zone_id_nonprod    = "${var.hosted_zone_id_nonprod}"

  enable_validation = "${var.enable_validation}"

  providers = {
    aws.dns = "aws"
    aws.dns-nonprod = "aws.nonprod_us-east-1"
  }
}

#module "dns_zone" {
#  source            = "git@github.com:HBOCodeLabs/terraform-aws-route53-zone.git?ref=2019.8.12.1-13"
#
#  region            = "${var.region}"
#  environment       = "${var.environment}"
#  cluster           = "${var.cluster}"
#  service           = "${var.service}"
#  project           = "${var.project}"
#  name              = "${var.hosted_zone_name}"
#}
