module "acm" {
  source             = "../../."
  domain_name        = "test.sandbox.wmdtc.tech"
  domain_name_alt    = "paulmickus.org"
  certificate_name   = "test.sandbox.wmdtc.tech"
  environment        = "sandbox"
  project            = "test"
  service            = "test"
  cluster            = "test"
  region             = "us-east-1"
  enable_validation  = true

  hosted_zone_id     = "Z1RFR1GBA4V8R5"
  hosted_zone_id_alt = "Z11ZPM88VFI29O"

  subject_alternative_names = ["test-record-b.sandbox.wmdtc.tech"]
  subject_alternative_names_alt = ["test-record-a.paulmickus.org"]

  providers = {
    aws = aws
    aws.alt = aws.nonprod
  }
}
