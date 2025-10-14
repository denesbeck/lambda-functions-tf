resource "aws_s3_bucket" "s3_lambda_functions" {
  bucket = "lambda-functions-5d47b429"

  tags = {
    "application" = "common"
  }
}

resource "aws_s3_bucket" "s3_lambda_layers" {
  bucket = "lambda-layers-fb0156a1"

  tags = {
    "application" = "common"
  }
}

resource "aws_s3_bucket" "s3_lambda_hashes" {
  bucket = "lambda-hashes-ac780253"

  tags = {
    "application" = "common"
  }
}
