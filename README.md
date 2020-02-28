# terraform-aws-acm-certificate #

This Terraform module creates TLS/SSL certificate in Amazon Certificate Manager (ACM), and validates it with DNS by creating required Route 53 validation record in the given Route 53 hosted zone.

This module creates the following resources:
* [aws_acm_certificate](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html)
* [aws_route53_record](https://www.terraform.io/docs/providers/aws/r/route53_record.html)
* [aws_acm_certificate_validation](https://www.terraform.io/docs/providers/aws/r/acm_certificate_validation.html)

## Terraform 0.12

This module has been upgraded to support Terraform 0.12.  The last version compatible 
with 0.11 is version 2019.2.15.2-8.

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| name | DNS zone name | string | `None` | yes |
| region | Which AWS Region to deploy into | string | `None` | yes |
| environment | The operational environment of this infrastructure | string | `None` | yes |
| cluster | The cluster that this infrastructure will operate | string | `None` | yes |
| service | The service that this cluster will operate | string | `None` | yes |
| project | The project being worked on | string | `None` | yes |
| certificate_name | Name of the ACM certificate | string | `None` | yes |
| domain_name | Domain name the certificate is issued for | string | `None` | yes |
| hosted_zone_name | Need for DNS validation, hosted zone name where record validation will be stored | string | `Empty` | no |
| hosted_zone_id | Need for DNS validation, hosted zone ID used when zone being created inline | string | `Empty` | no |
| subject_alternative_names_mgmt | A list of domains that should be SANs in the issued certificate in mgmt | list | [] | no |
| hosted_zone_names_mgmt | The hosted zones for the mgmt alternates | list | [] | no |
| subject_alternative_names_nonprod | A list of domains that should be SANs in the issued certificate in nonprod | list | [] | no |
| hosted_zone_names_nonprod | The hosted zones for the nonprod alternates | list | [] | no |
| subject_alternative_names_hbogo | A list of domains that should be SANs in the issued certificate in hbogo | list | [] | no |
| hosted_zone_names_hbogo | The hosted zones for the hbogo alternates | list | [] | no |
| subject_alternative_names_sandbox | A list of domains that should be SANs in the issued certificate | list | [] | no |
| hosted_zone_names_sandbox | The hosted zones for the sandbox alternates | list | [] | no |
| enable_validation | Should we run the validation step or not.  Used for testing | string | `true` | no |

## Outputs
| Name | Description |
|------|-------------|
| acm_certificate_arn | arn of acm certificate |
| acm_certificate_dns_validation_records | records which are used to validate acm certificate |

## Providers 
| Name | Description |
|------|-------------|
| aws | The account the certificaite will be created in |
| aws.dns | The account that the core validation record is created in |
| aws.mgmt | The mgmt account for alternates in the mgmt account |
| aws.nonprod | The nonprod account for alternates in the nonprod account |
| aws.sandbox | The sandbox account for alternates in the sandbox account |
| aws.hbogo | The hbogo account for alternates in the hbogo account |
