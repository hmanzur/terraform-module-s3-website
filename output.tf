output "s3_id" {
  value       = aws_s3_bucket.website.id
  description = "S3 id"
}

output "website_endpoint" {
  value       = aws_s3_bucket.website.website_endpoint
  description = "Website endpoint"
}

output "cloudfront_id" {
  value       = aws_cloudfront_distribution.default.id
  description = "Cloudfront id"
}

output "domain_name" {
  value       = aws_cloudfront_distribution.default.domain_name
  description = "Cloudfront domain name"
}