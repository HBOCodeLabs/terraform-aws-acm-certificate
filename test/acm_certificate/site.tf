provider "aws" {
  version = ">= 2.6.0"
  region  = var.region
}

#provider "aws" {
#  version = ">=2.6.0"
#  region  = "${var.region}"
#
#  #access_key = "${var.MGMT_ADMIN_AWS_ACCESS_KEY_ID}"
#  #secret_key = "${var.MGMT_ADMIN_AWS_SECRET_ACCESS_KEY}"
#  #token = "${var.MGMT_ADMIN_AWS_SECURITY_TOKEN}"
#}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "${var.nonprod_role_arn}"
  }
  alias = "nonprod_us-east-1"

  #access_key = "${var.NONPROD_ADMIN_AWS_ACCESS_KEY_ID}"
  #secret_key = "${var.NONPROD_ADMIN_AWS_SECRET_ACCESS_KEY}"
  #token = "${var.NONPROD_ADMIN_AWS_SECURITY_TOKEN}"
  access_key = "${var.NONPROD_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.NONPROD_AWS_SECRET_ACCESS_KEY}"
  token = "${var.NONPROD_AWS_SECURITY_TOKEN}"
}

#provider "aws" {
#  version = ">= 2.6.0"
#  region = "us-east-1"
#  assume_role {
#    #role_arn = "${var.sandbox_role_arn}"
#    role_arn = "${var.TF_VAR_SANDBOX_ASSUMED_ROLE}"
#  }
#  alias = "sandbox_us-east-1"
#
#  access_key = "${var.TF_VAR_SANDBOX_AWS_ACCESS_KEY_ID}"
#  secret_key = "${var.TF_VAR_SANDBOX_AWS_SECRET_ACCESS_KEY}"
#  token = "${var.TF_VAR_SANDBOX_AWS_SECURITY_TOKEN}"
#}
