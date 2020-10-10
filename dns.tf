resource "aws_route53_record" "core_zone" {
  provider = "aws.dns"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if dvo.domain_name == var.domain_name
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.zone.zone_id
}

resource "aws_route53_record" "mgmt_zones" {
  provider = "aws.mgmt"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if contains(var.subject_alternative_names_mgmt, dvo.domain_name)
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.mgmt_zones.zone_id
}

resource "aws_route53_record" "nonprod_zones" {
  provider = "aws.nonprod"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if contains(var.subject_alternative_names_nonprod, dvo.domain_name)
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.nonprod_zones.zone_id
}

resource "aws_route53_record" "sandbox_zones" {
  provider = "aws.sandbox"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if contains(var.subject_alternative_names_sandbox, dvo.domain_name)
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.sandbox_zones.zone_id
}

resource "aws_route53_record" "hbogo_zones" {
  provider = "aws.hbogo"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if contains(var.subject_alternative_names_hbogo, dvo.domain_name)
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.hbogo_zones.zone_id
}

resource "aws_route53_record" "production_zones" {
  provider = "aws.production"

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options:
    dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      if contains(var.subject_alternative_names_production, dvo.domain_name)
    }
  }

  allow_overwrite   = true
  ttl               = 60
  name              = each.value.name
  type              = each.value.type
  records           = [each.value.record]
  zone_id           = data.aws_route53_zone.production_zones.zone_id
}
