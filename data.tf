data "aws_route53_zone" "zone" {
  name          = var.hosted_zone_name
  private_zone  = "false"

  provider      = "aws.dns"

  count         = var.hosted_zone_name != "" ? 1 : 0
}

data "aws_route53_zone" "mgmt_zones" {
  name          = var.hosted_zone_names_mgmt[count.index]
  private_zone  = "false"

  provider      = "aws.mgmt"

  count         = length(var.hosted_zone_names_mgmt)
}

data "aws_route53_zone" "nonprod_zones" {
  name          = var.hosted_zone_names_nonprod[count.index]
  private_zone  = "false"

  provider      = "aws.nonprod"

  count         = length(var.hosted_zone_names_nonprod)
}

data "aws_route53_zone" "hbogo_zones" {
  name          = var.hosted_zone_names_hbogo[count.index]
  private_zone  = "false"

  provider      = "aws.hbogo"

  count         = length(var.hosted_zone_names_hbogo)
}

data "aws_route53_zone" "sandbox_zones" {
  name          = var.hosted_zone_names_sandbox[count.index]
  private_zone  = "false"

  provider      = "aws.sandbox"

  count         = length(var.hosted_zone_names_sandbox)
}

data "aws_route53_zone" "production_zones" {
  name          = var.hosted_zone_names_production[count.index]
  private_zone  = "false"

  provider      = "aws.production"

  count         = length(var.hosted_zone_names_production)
}
