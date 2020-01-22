provider "aws" {
  version = ">= 2.6.0"
  region  = var.region
}

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
