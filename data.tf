data "aws_route53_zone" "zone" {
  name         = "${var.hosted_zone_name}"
  private_zone = "false"

  #provider      = "aws.dns"
  provider      = "aws.dns-sandbox"

  count         = "${var.hosted_zone_name != "" ? 1 : 0}"
}
