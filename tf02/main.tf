resource "aws_s3_bucket" "b" {
  bucket = "bucket-senti-dev"
}

resource "aws_s3_bucket_acl" "s3bucket_acl" {
  bucket = aws_s3_bucket.b.id
  access_control_policy {
    grant {
        grantee {

        }
        permission="READ"
    }
  }
}