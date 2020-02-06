# WILL NEED TO UPDATE THIS TO MGMT BEFORE MERGING TO MASTER
provider "aws" {
  version = ">= 2.6.0"
  region  = var.region
}

# WILL NEED TO UPDATE TIS TO USE NONPROD_ADMIN BEFORE MERGING TO MASTER
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "${var.nonprod_role_arn}"
  }
  alias = "nonprod_us-east-1"

  access_key = "${var.NONPROD_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.NONPROD_AWS_SECRET_ACCESS_KEY}"
  token = "${var.NONPROD_AWS_SECURITY_TOKEN}"
}

#provider "aws" {
#  region = "us-east-1"
#  assume_role {
#    role_arn = "${var.prod_role_arn}"
#  }
#  alias = "prod_us-east-1"
#
#  access_key = "${var.PROD_ADMIN_AWS_ACCESS_KEY_ID}"
#  secret_key = "${var.PROD_ADMIN_AWS_SECRET_ACCESS_KEY}"
#  token = "${var.PROD_ADMIN_AWS_SECURITY_TOKEN}"
#}
#
#provider "aws" {
#  region = "us-east-1"
#  assume_role {
#    role_arn = "${var.hbogo_role_arn}"
#  }
#  alias = "hbogo_us-east-1"
#
#  access_key = "${var.HBOGO_ADMIN_AWS_ACCESS_KEY_ID}"
#  secret_key = "${var.HBOGO_AMDIN_AWS_SECRET_ACCESS_KEY}"
#  token = "${var.HBOGO_ADMIN_AWS_SECURITY_TOKEN}"
#}
#
#provider "aws" {
#  region = "us-east-1"
#  assume_role {
#    role_arn = "${var.sandbox_role_arn}"
#  }
#  alias = "sandbox_us-east-1"
#
#  access_key = "${var.SANDBOX_ADMIN_AWS_ACCESS_KEY_ID}"
#  secret_key = "${var.SANDBOX_ADMIN_AWS_SECRET_ACCESS_KEY}"
#  token = "${var.SANDBOX_ADMIN_AWS_SECURITY_TOKEN}"
#}
