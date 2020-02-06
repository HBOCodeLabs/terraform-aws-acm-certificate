region = "us-east-1"
environment = "sandbox"
cluster = "sre"
service = "ecs"
project = "srecore"

certificate_name = "test-cert.sandbox.wmdtc.tech"
domain_name_sandbox = "test-record.sandbox.wmdtc.tech"
subject_alternative_names_sandbox = ["*.sandbox.wmdtc.tech", "test.sandbox.wmdtc.tech"]
subject_alternative_names_nonprod = ["test-record.snp.wmdtc.tech"]

enable_validation = "true"
