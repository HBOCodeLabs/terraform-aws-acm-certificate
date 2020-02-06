#/* This is a provider used for the DNS record creation as we host zones accross multiple accounts */
provider "aws" {
  alias = "dns"
}

provider "aws" {
  alias = "dns-nonprod"
}

provider "aws" {
  region = var.region
  alias = "dns-production"
}

provider "aws" {
  region = var.region
  alias = "dns-hbogo"
}

provider "aws" {
  region = var.region
  alias = "dns-sandbox"
}

provider "aws" {
  region = var.region
  alias = "dns-management"
}
