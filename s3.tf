resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name

  acl = "public-read"

  policy = var.policy ? var.policy : templatefile("${path.module}/files/policy.json.tpl", {
    bucket = var.bucket_name
  })

  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }

  website {
    index_document = var.index_document
    error_document = var.error_document
  }

  tags = {
    Terraform   = "true"
    Description = "${var.bucket_name} bucket"
    "Workspace" = terraform.workspace
  }
}