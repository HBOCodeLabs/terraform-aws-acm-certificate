region = "us-east-1"
environment = "sandbox"
cluster = "sre"
service = "ecs"
project = "srecore"

certificate_name = "test-cert.sandbox.wmdtc.tech"
domain_name = "test-record.sandbox.wmdtc.tech"
subject_alternative_names = ["*.test-record.sandbox.wmdtc.tech."]
subject_alternative_names_nonprod = ["test-record.snp.wmdtc.tech."]
hosted_zone_id = "Z1RFR1GBA4V8R5"
hosted_zone_id_nonprod = "Z384J0FBY88JRX"

enable_validation = "true"

#hosted_zone_name = "sandbox.wmdtc.tech"
