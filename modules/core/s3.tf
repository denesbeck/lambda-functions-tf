resource "random_string" "random" {
  length  = 16
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "aws_s3_bucket" "s3_lambda_functions" {
  bucket        = "lambda-functions-${random_string.random.id}"
  force_destroy = true

  tags = {
    "application" = "lambda-functions"
  }
}

resource "aws_s3_bucket" "s3_lambda_layers" {
  bucket        = "lambda-layers-${random_string.random.id}"
  force_destroy = true

  tags = {
    "application" = "lambda-functions"
  }
}

resource "aws_s3_bucket" "s3_lambda_hashes" {
  bucket        = "lambda-hashes-${random_string.random.id}"
  force_destroy = true

  tags = {
    "application" = "lambda-functions"
  }
}
