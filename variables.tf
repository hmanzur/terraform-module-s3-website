variable "bucket_name" {
  description = "S3 Bucket name"
}

variable "index_document" {
  default = "index.html"
  description = "Root index page"
}

variable "error_document" {
  default = "index.html"
  description = "Failover default page"
}

variable "cloudfront" {
  default     = false
  type        = bool
  description = "Enable CloudFront"
}

variable "policy" {
  default     = false
  description = "Custom policy"
}

variable "aliases" {
  default     = []
  description = "Cloudfront domain aliases"
}

variable "whitelist" {
  default     = ["US", "CA", "GB", "DE"]
  description = "Cloudfront location whitelist"
}