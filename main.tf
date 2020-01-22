resource "aws_acm_certificate" "this" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"

  subject_alternative_names = "${compact(concat(var.subject_alternative_names, var.subject_alternative_names_alt))}"

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

locals {
  domain_validation_options     = [for s in aws_acm_certificate.this.domain_validation_options : s if contains(compact(concat(var.subject_alternative_names, list(var.domain_name))), s.domain_name)]
  domain_validation_options_alt = [for s in aws_acm_certificate.this.domain_validation_options : s if contains(var.subject_alternative_names_alt, s.domain_name)]
}

resource "aws_route53_record" "this" {
  count   = "${length(var.subject_alternative_names) + 1}"
  name    = "${element(local.domain_validation_options, count.index).resource_record_name}"
  type    = "${element(local.domain_validation_options, count.index).resource_record_type}"
  zone_id = "${element(compact(concat(list(var.hosted_zone_id), data.aws_route53_zone.zone.*.id)), 0)}"
  records = ["${element(local.domain_validation_options, count.index).resource_record_value}"]
  ttl     = 60

  allow_overwrite = true
}

resource "aws_route53_record" "alt" {
  count   = "${length(var.subject_alternative_names_alt)}"
  name    = "${element(local.domain_validation_options_alt, count.index).resource_record_name}"
  type    = "${element(local.domain_validation_options_alt, count.index).resource_record_type}"
  zone_id = "${element(compact(concat(list(var.hosted_zone_id_alt), data.aws_route53_zone.zone.*.id)), 0)}"
  records = ["${element(local.domain_validation_options_alt, count.index).resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  provider = aws.alt
}


resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn         = "${aws_acm_certificate.this.arn}"
  count = "${var.enable_validation ? 1 : 0}"
}

