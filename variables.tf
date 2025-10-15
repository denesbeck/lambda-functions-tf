variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "ssm_kms_key_id" {
  type        = string
  description = "SSM KMS Key Id"
}

variable "lambda_functions_repo" {
  type        = string
  default     = "denesbeck/lambda-functions"
  description = "GitHub repository for the Lambda functions in the format `owner/repo`"
}

variable "timezone_eu" {
  type        = string
  default     = "Europe/Paris"
  description = "Timezone EU"
}

variable "timezone_us" {
  type        = string
  default     = "America/New_York"
  description = "Timezone US"
}
