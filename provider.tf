#/* This is a provider used for the DNS record creation as we host zones accross multiple accounts */
provider "aws" {
  alias = "dns-sandbox"
  #region = "${var.region}"
}

#provider "aws" {
#  alias = "dns-sandbox"
#  #region = "us-east-1"
#}

provider "aws" {
  alias = "dns-nonprod"
  region = "${var.region}"
}
