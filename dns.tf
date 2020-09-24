resource "aws_route53_record" "core_zone" {
  name    = "${local.core_validation[0].resource_record_name}"
  type    = "${local.core_validation[0].resource_record_type}"
  zone_id = "${element(compact(concat(list(var.hosted_zone_id), data.aws_route53_zone.zone.*.id)), 0)}"
  records = ["${local.core_validation[0].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  provider = "aws.dns"
}

resource "aws_route53_record" "mgmt_zones" {
  name    = "${local.mgmt_validation[count.index].resource_record_name}"
  type    = "${local.mgmt_validation[count.index].resource_record_type}"
  zone_id = "${data.aws_route53_zone.mgmt_zones[index(var.subject_alternative_names_mgmt, local.mgmt_validation[count.index].domain_name)].id}"
  records = ["${local.mgmt_validation[count.index].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  count   = "${length(var.subject_alternative_names_mgmt)}"

  provider = "aws.mgmt"
}

resource "aws_route53_record" "nonprod_zones" {
  name    = "${local.nonprod_validation[count.index].resource_record_name}"
  type    = "${local.nonprod_validation[count.index].resource_record_type}"
  zone_id = "${data.aws_route53_zone.nonprod_zones[index(var.subject_alternative_names_nonprod, local.nonprod_validation[count.index].domain_name)].id}"
  records = ["${local.nonprod_validation[count.index].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  count   = "${length(var.subject_alternative_names_nonprod)}"

  provider = "aws.nonprod"
}

resource "aws_route53_record" "sandbox_zones" {
  name    = "${local.sandbox_validation[count.index].resource_record_name}"
  type    = "${local.sandbox_validation[count.index].resource_record_type}"
  zone_id = "${data.aws_route53_zone.sandbox_zones[index(var.subject_alternative_names_sandbox, local.sandbox_validation[count.index].domain_name)].id}"
  records = ["${local.sandbox_validation[count.index].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  count   = "${length(var.subject_alternative_names_sandbox)}"

  provider = "aws.sandbox"
}

resource "aws_route53_record" "hbogo_zones" {
  name    = "${local.hbogo_validation[count.index].resource_record_name}"
  type    = "${local.hbogo_validation[count.index].resource_record_type}"
  zone_id = "${data.aws_route53_zone.hbogo_zones[index(var.subject_alternative_names_hbogo, local.hbogo_validation[count.index].domain_name)].id}"
  records = ["${local.hbogo_validation[count.index].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  count   = "${length(var.subject_alternative_names_hbogo)}"

  provider = "aws.hbogo"
}

resource "aws_route53_record" "production_zones" {
  name    = "${local.production_validation[count.index].resource_record_name}"
  type    = "${local.production_validation[count.index].resource_record_type}"
  zone_id = "${data.aws_route53_zone.production_zones[index(var.subject_alternative_names_production, local.production_validation[count.index].domain_name)].id}"
  records = ["${local.production_validation[count.index].resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  count   = "${length(var.subject_alternative_names_production)}"

  provider = "aws.production"
}
