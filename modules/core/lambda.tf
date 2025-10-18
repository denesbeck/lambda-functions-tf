resource "aws_lambda_function" "arcade_lab_contact" {
  function_name = "ArcadeLabContact"
  role          = var.arcade_lab_contact_role_arn
  handler       = "PLACEHOLDER"
  runtime       = "nodejs22.x"
  filename      = "PLACEHOLDER.zip"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_lambda_function" "lambda_layer_cleanup" {
  function_name = "LambdaLayerCleanup"
  role          = var.arcade_lab_contact_role_arn
  handler       = "PLACEHOLDER"
  runtime       = "nodejs22.x"
  filename      = "PLACEHOLDER.zip"
  lifecycle {
    ignore_changes = all
  }
}
