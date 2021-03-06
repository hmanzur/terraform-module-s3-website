# Terraform Module AWS S3 Website

Creates a website using S3 bucket with Website and CloudFront if needed

## Example

### Simple S3 Website 

```workflow
module "website" {
  source          = "git@github.com:hmanzur/terraform-module-s3-website.git"
  bucket_name     = "my-cool-bucket"

  // Optional, default is "index.html"
  index_document  = "index.html"

  // Optional, default is "index.html"
  error_document  = "index.html"

  // custom policy
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.b.arn,
          "${aws_s3_bucket.b.arn}/*",
        ]
        Condition = {
          IPAddress = {
            "aws:SourceIp" = "8.8.8.8/32"
          }
        }
      },
    ]
  })
}
```

### With Cloudfront

```workflow
module "website" {
  source = "git@github.com:hmanzur/terraform-module-s3-website.git"

  bucket_name = "my-cool-bucket"

  // Enables cloudfront
  cloudfront = true

  whitelist = ["US", "CA", "GB", "DE"]

  aliases = ["my.domain.com", "example.domain.com", "..."]
}
```

## Variables

| Variable          | Default                             | Required | Description                   |
|-------------------|-------------------------------------|----------|-------------------------------|
| bucket_name       |                                     | Yes      | S3 Bucket name                |
| index_document    | `index.html`                        | No       | Root index page               |
| error_document    | `index.html`                        | No       | Failover default page         |
| cloudfront        | false                               | No       | Enables CloudFront            |
| policy            |[policy.json](files/policy.json.tpl) | No       | Custom policy                 |
| aliases           | []                                  | No       | Cloudfront domain aliases     |
| whitelist         | `["US", "CA", "GB", "DE"]`          | No       | Cloudfront location whitelist |

## Outputs

- S3 id: `s3_id`
- S3 website endpoint: `website_endpoint`
- Cloudfront Id: `cloudfront_id`
- Cloudfront domain name: `domain_name`
