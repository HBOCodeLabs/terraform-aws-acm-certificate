provider "aws" {
  version = ">= 2.6.0"
  region  = var.region
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    #role_arn = "${var.nonprod_role_arn}"
    role_arn = "${var.TF_VAR_NONPROD_ASSUMED_ROLE}"
  }
  alias = "nonprod_us-east-1"

  #access_key = "${var.NONPROD_ADMIN_AWS_ACCESS_KEY_ID}"
  #secret_key = "${var.NONPROD_ADMIN_AWS_SECRET_ACCESS_KEY}"
  #token = "${var.NONPROD_ADMIN_AWS_SECURITY_TOKEN}"
  access_key = "${var.TF_VAR_NONPROD_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.TF_VAR_NONPROD_AWS_SECRET_ACCESS_KEY}"
  token = "${var.TF_VAR_NONPROD_AWS_SECURITY_TOKEN}"
}

#provider "aws" {
#  version = ">= 2.6.0"
#  region = "us-east-1"
#  assume_role {
#    role_arn = "${var.sandbox_role_arn}"
#  }
#  alias = "sandbox_us-east-1"

#  access_key = "${var.SANDBOX_ADMIN_AWS_ACCESS_KEY_ID}"
#  secret_key = "${var.SANDBOX_ADMIN_AWS_SECRET_ACCESS_KEY}"
#  token = "${var.SANDBOX_ADMIN_AWS_SECURITY_TOKEN}"
#}
