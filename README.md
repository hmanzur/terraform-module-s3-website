# Terraform Module AWS S3 Website

Using S3 Website and CloudFront if needed

How to use

```workflow
module "vpc" {
  source = "git@github.com:hmanzur/terraform-module-s3-website.git"

  name = "VPC Cool Name"
}
```

## Variables

| Variable   | Default     | Required | Description    |
|------------|-------------|----------|----------------|
| name       | 10.0.0.0/16 | No       | VPC name       |
| cidr_block |             | Yes      | VPC CIDR Block |

## Outputs

- The VPC `Id`
- The VPC `cidr_block`
