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

#variable "hosted_zone_name" {
#  type        = "string"
#}

variable "hosted_zone_id" {
  type        = "string"
}

variable "hosted_zone_id_nonprod" {
  type        = "string"
}

variable "enable_validation" {
  description = "Should we run the validation step or not.  Used for testing"
  type        = "string"
  default     = "true"
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = "list"
  default     = [] 
}

variable "subject_alternative_names_nonprod" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = "list"
  default     = [] 
}

variable "TF_VAR_NONPROD_ASSUMED_ROLE" {
  type          = "string"
  default       = null
}
variable "TF_VAR_NONPROD_AWS_ACCESS_KEY_ID" {
  type          = "string"
  default       = null
}
variable "TF_VAR_NONPROD_AWS_SECRET_ACCESS_KEY" {
  type          = "string"
  default       = null
}
variable "TF_VAR_NONPROD_AWS_SECURITY_TOKEN" {
  type          = "string"
  default       = null
}
#variable "dns_record" {
#  type = "string"
#}
