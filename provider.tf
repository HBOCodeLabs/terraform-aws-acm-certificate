#/* This is a provider used for the DNS record creation as we host zones accross multiple accounts */
provider "aws" {
  alias = "dns"
}

provider "aws" {
  alias = "mgmt"
}

provider "aws" {
  alias = "nonprod"
}

provider "aws" {
  alias = "hbogo"
}

provider "aws" {
  alias = "sandbox"
}

provider "aws" {
  alias = "production"
}
