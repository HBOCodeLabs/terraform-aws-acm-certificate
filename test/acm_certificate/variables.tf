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
variable "domain_name_sandbox" {
  type        = "string"
  default     = ""
}
variable "domain_name_nonprod" {
  type        = "string"
  default     = ""
}

variable "hosted_zone_name" {
  type        = "string"
  default     = ""
}

variable "hosted_zone_id" {
  type        = "string"
  default     = ""
}

variable "hosted_zone_id_nonprod" {
  type        = "string"
  default     = ""
}

variable "enable_validation" {
  description = "Should we run the validation step or not.  Used for testing"
  type        = "string"
  default     = "true"
}

variable "nonprod_role_arn" {
  type          = "string"
  default       = null
}
variable "NONPROD_AWS_ACCESS_KEY_ID" {
  type          = "string"
  default       = null
}
variable "NONPROD_AWS_SECRET_ACCESS_KEY" {
  type          = "string"
  default       = null
}
variable "NONPROD_AWS_SECURITY_TOKEN" {
  type          = "string"
  default       = null
}
variable "subject_alternative_names_nonprod" {
  type = "list"
  default = []
}
variable "subject_alternative_names_sandbox" {
  type = "list"
  default = []
}
