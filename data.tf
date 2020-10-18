data "aws_route53_zone" "zone" {
  provider      = "aws.dns"

  private_zone  = false
  for_each      = local.hzn
  name          = each.value
}

data "aws_route53_zone" "mgmt_zones" {
  provider      = "aws.mgmt"

  private_zone  = false
  for_each      = toset(var.hosted_zone_names_mgmt)
  name          = each.value
}

data "aws_route53_zone" "nonprod_zones" {
  provider      = "aws.nonprod"

  private_zone  = false
  for_each      = toset(var.hosted_zone_names_nonprod)
  name          = each.value
}

data "aws_route53_zone" "hbogo_zones" {
  provider      = "aws.hbogo"

  private_zone  = false
  for_each      = toset(var.hosted_zone_names_hbogo)
  name          = each.value
}

data "aws_route53_zone" "sandbox_zones" {
  provider      = "aws.sandbox"

  private_zone  = false
  for_each      = toset(var.hosted_zone_names_sandbox)
  name          = each.value
}

data "aws_route53_zone" "production_zones" {
  provider      = "aws.production"

  private_zone  = false
  for_each      = toset(var.hosted_zone_names_production)
  name          = each.value
}
