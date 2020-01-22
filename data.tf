data "aws_route53_zone" "zone" {
  name         = "${var.hosted_zone_name}"
  private_zone = "false"

  count         = "${var.hosted_zone_name != "" ? 1 : 0}"
}

data "aws_route53_zone" "zone_alt" {
  name         = "${var.hosted_zone_name_alt}"
  private_zone = "false"

  count         = "${var.hosted_zone_name_alt != "" ? 1 : 0}"

  provider = aws.alt
}
