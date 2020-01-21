module "record" {
  source = "git@github.com:HBOCodeLabs/terraform-aws-route53-record.git?ref=2019.11.12.3-12"

  region = "${var.region}"

  record_routing_policy = "${var.record_routing_policy}"

  dns_zone = "${var.dns_zone}"
  dns_record = "${var.dns_record}"

  records = "${var.records}"

  providers = {
    aws.dns = "aws"
  }
}
