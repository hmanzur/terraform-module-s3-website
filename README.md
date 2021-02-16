# Terraform Module AWS S3 Website

Using S3 Website and CloudFront if needed

How to use

```workflow
module "website" {
  source = "git@github.com:hmanzur/terraform-module-s3-website.git"
  
  bucket_name = "my-cool-bucket"
  enable_cloudfront = true
}
```

## Variables

| Variable          | Default     | Required | Description    |
|-------------------|-------------|----------|----------------|
| name              | 10.0.0.0/16 | No       | VPC name       |
| enable_cloudfront |             | Yes      | VPC CIDR Block |

## Outputs

- The VPC `Id`
- The VPC `cidr_block`
