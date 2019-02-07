package test

import (
	"testing"
	"fmt"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/aws/aws-sdk-go/service/acm"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/aws"
)

func TestTerraform(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
		TerraformDir: ".",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"region": "us-east-1",
			"environment": "sandbox",
			"cluster": "sre",
			"service": "ecs",
			"project": "srecore",

			"vpc_id": "vpc-00d6b51d02b2d5160",
            "hosted_zone_name": "sandbox-terratest.hbo.com",

            "domain_name": "*.sandbox-terratest.hbo.com",
            "certificate_name": "sandbox-terratest.hbo.com",
            "description": "sandbox terratest",
            "product_domain": "sandbox",
            "enable_validation": "false",
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

    // ACM
    acm_arn := terraform.Output(t, terraformOptions, "acm_certificate_arn")
    var acm_arns []string

    svc_acm := acm.New(session.New(&aws.Config{
        Region: aws.String("us-east-1"),
    }))
    input_acm := &acm.ListCertificatesInput{
        CertificateStatuses: []*string{},
    }
    err_acm := svc_acm.ListCertificatesPages(input_acm,
        func(page *acm.ListCertificatesOutput, lastPage bool) bool {
            for _, v := range page.CertificateSummaryList {
                acm_arns = append(acm_arns, aws.StringValue(v.CertificateArn))
            }
            return lastPage
        },
    )
    if err_acm != nil {
        fmt.Println(err_acm.Error())
        return
    }

    assert.Contains(t, acm_arns, acm_arn)
}