provider "aws" {
  region = "us-east-1"

  access_key = "${var.SANDBOX_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.SANDBOX_AWS_SECRET_ACCESS_KEY}"
  token = "${var.SANDBOX_AWS_SECURITY_TOKEN}"
}

provider "aws" {
  region = "us-east-1"
  alias = "nonprod"

  access_key = "${var.NONPROD_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.NONPROD_AWS_SECRET_ACCESS_KEY}"
  #token = "${var.NONPROD_AWS_SECURITY_TOKEN}"
}
