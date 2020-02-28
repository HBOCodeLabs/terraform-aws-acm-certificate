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

variable "subject_alternative_names_sandbox" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = "list"
}
variable "hosted_zone_names_sandbox" {
  description = "The hosted zones for the mgmt alternates"
  type        = "list"
}
