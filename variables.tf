variable "bucket_name" {}

variable "index_document" {
  default = "index.html"
}

variable "error_document" {
  default = "index.html"
}

variable "cloudfront" {
  default     = false
  type        = bool
  description = "Enable CloudFront"
}

variable "policy" {
  default     = false
  description = "Set custom policy"
}

variable "aliases" {
  default     = []
  description = "Cloudfront Array Aliases"
}

variable "whitelist" {
  default     = ["US", "CA", "GB", "DE"]
  description = "Cloudfront location whitelist"
}