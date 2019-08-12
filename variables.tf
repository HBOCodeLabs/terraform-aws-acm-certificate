/* Which AWS Region to deploy into */
variable "region" {
  type    = "string"
}
/* The operational environment of this infrastructure */
variable "environment" {
  type    = "string"
}
/* The cluster that this infrastructure will operate */
variable "cluster" {
  type    = "string"
}
/* The service that this cluster will operate */
variable "service" {
  type    = "string"
}
/* The project being worked on */
variable "project" {
  type    = "string"
}

variable "certificate_name" {
  description = "Name of the ACM certificate."
  type        = "string"
}

variable "product_domain" {
  description = "Abbreviation of the product domain this ACM certificate belongs to."
  type        = "string"
}

variable "description" {
  description = "Free form description of this ACM certificate."
  type        = "string"
}

variable "domain_name" {
  description = "Domain name the certificate is issued for."
  type        = "string"
}

variable "hosted_zone_name" {
  description = "Need for DNS validation, hosted zone name where record validation will be stored."
  type        = "string"
  default     = ""
}
variable "hosted_zone_id" {
  description = "Need for DNS validation, hosted zone ID used when zone being created inline."
  type        = "string"
  default     = ""
}

variable "enable_validation" {
  description = "Should we run the validation step or not.  Used for testing"
  type        = "string"
  default     = true
}