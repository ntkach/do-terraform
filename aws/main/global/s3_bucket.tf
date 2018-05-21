#Set up s3 bucket for terraform states in us-east-2 (used for all regions)
resource "aws_s3_bucket" "TF_BUCKET" {
  bucket = "TF_BUCKET"

  acl = "private"

  force_destroy = "false"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
