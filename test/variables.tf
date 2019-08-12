variable "environment" {
  type        = "string"
}
variable "region" {
  type    = "string"
}
variable "cluster" {
  type    = "string"
}
variable "service" {
  type    = "string"
}
variable "project" {
  type    = "string"
}

/* VPC ID for private zone */
variable "vpc_id" {
  type    = "string"
  default = ""
}

variable "certificate_name" {
  type        = "string"
}
variable "product_domain" {
  type        = "string"
}
variable "description" {
  type        = "string"
}
variable "domain_name" {
  type        = "string"
}

variable "hosted_zone_name" {
  type        = "string"
}

variable "enable_validation" {
  description = "Should we run the validation step or not.  Used for testing"
  type        = "string"
  default     = "true"
}