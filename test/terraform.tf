module "dns_zone" {
  source            = "git@github.com:HBOCodeLabs/terraform-aws-route53-zone.git?ref=2018.12.20.1-1"

  region            = "${var.region}"
  environment       = "${var.environment}"
  cluster           = "${var.cluster}"
  service           = "${var.cluster}"
  name              = "${var.hosted_zone_name}"
}

module "acm_cert" {
  source            = ".."

  environment       = "${var.environment}"
  certificate_name  = "${var.certificate_name}"
  product_domain    = "${var.product_domain}"
  description       = "${var.description}"
  domain_name       = "${var.domain_name}"
  hosted_zone_name  = "${module.dns_zone.route53_zone_name}"

  enable_validation = "${var.enable_validation}"
}