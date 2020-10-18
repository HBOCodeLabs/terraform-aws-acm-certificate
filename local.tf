locals {
  hzn = var.hosted_zone_name != "" : toset([var.hosted_zone_name]) : null
}
