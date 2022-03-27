provider "aws" {
  region  = "us-east-1"
}
resource "aws_s3_bucket" "web" {
  bucket = "NOME_DO_BUCKET"
  acl    = "public-read"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
	      "arn:aws:s3:::NOME_DO_BUCKET/*",
        "arn:aws:s3:::NOME_DO_BUCKET"
      ]
    }
  ]
}
POLICY
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}