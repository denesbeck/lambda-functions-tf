data "aws_caller_identity" "current" {}

data "aws_kms_key" "default_eu" {
  key_id   = "alias/aws/ssm"
  provider = aws.eu
}

data "aws_kms_key" "default_us" {
  key_id   = "alias/aws/ssm"
  provider = aws.us
}
