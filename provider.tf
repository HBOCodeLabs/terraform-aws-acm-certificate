#/* This is a provider used for the DNS record creation as we host zones accross multiple accounts */
provider "aws" {
  alias = "dns"
}

provider "aws" {
  alias = "dns-nonprod"
}
