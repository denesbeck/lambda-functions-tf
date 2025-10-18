output "s3_resources" {
  value = [
    aws_s3_bucket.s3_lambda_functions.arn,
    "${aws_s3_bucket.s3_lambda_functions.arn}/*",
    aws_s3_bucket.s3_lambda_layers.arn,
    "${aws_s3_bucket.s3_lambda_layers.arn}/*",
    aws_s3_bucket.s3_lambda_hashes.arn,
    "${aws_s3_bucket.s3_lambda_hashes.arn}/*",
  ]
}
