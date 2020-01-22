resource "aws_acm_certificate" "this" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"

  subject_alternative_names = "${concat(var.subject_alternative_names, var.subject_alternative_names_nonprod)}"

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

resource "aws_route53_record" "this" {
  name    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_type}"
  zone_id = "${element(compact(concat(list(var.hosted_zone_id), data.aws_route53_zone.zone.*.id)), 0)}"
  records = ["${aws_acm_certificate.this.domain_validation_options.0.resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  provider = "aws.dns"
}

resource "aws_route53_record" "this_nonprod" {
  name    = "${aws_acm_certificate.this.domain_validation_options.2.resource_record_name}"
  type    = "${aws_acm_certificate.this.domain_validation_options.2.resource_record_type}"
  zone_id = "${element(compact(concat(list(var.hosted_zone_id_nonprod), data.aws_route53_zone.zone_nonprod.*.id)), 0)}"
  records = ["${aws_acm_certificate.this.domain_validation_options.2.resource_record_value}"]
  ttl     = 60

  allow_overwrite = true

  provider = "aws.dns-nonprod"
}

resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn         = "${aws_acm_certificate.this.arn}"
  validation_record_fqdns = "${concat([aws_route53_record.this.fqdn], [aws_route53_record.this_nonprod.fqdn])}"

  provider = "aws.dns"

  count = "${var.enable_validation ? 1 : 0}"
}
