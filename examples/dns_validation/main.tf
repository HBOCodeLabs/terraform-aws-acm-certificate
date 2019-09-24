module "acm" {
  source           = "../../"
  domain_name      = "*.stg-tvlk.cloud"
  hosted_zone_name = "stg-tvlk.cloud"
  certificate_name = "wildcard.stg-tvlk.cloud"
  environment      = "staging"
  description      = "Wildcard certificate for example.stg-tvlk.cloud"
  product_domain   = "exm"
}
