module "dns_zone" {
  source            = "git@github.com:HBOCodeLabs/terraform-aws-route53-zone.git?ref=2019.8.12.1-13"

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.cluster}"
  project           = "${var.project}"
  name              = "${var.hosted_zone_name}"
}

module "acm_cert" {
  source            = "./.."

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.cluster}"
  project           = "${var.project}"

  certificate_name  = "${var.certificate_name}"
  product_domain    = "${var.product_domain}"
  description       = "${var.description}"
  domain_name       = "${var.domain_name}"
  hosted_zone_id    = "${module.dns_zone.route53_zone_id}"

  enable_validation = "${var.enable_validation}"
}