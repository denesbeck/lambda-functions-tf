resource "aws_lambda_function" "arcade_lab_contact" {
  function_name = "ArcadeLabContact"
  role          = aws_iam_role.arcade_lab_contact.arn
  handler       = "PLACEHOLDER"
  runtime       = "nodejs22.x"
  filename      = "PLACEHOLDER.zip"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_lambda_function" "lambda_layer_cleanup" {
  function_name = "LambdaLayerCleanup"
  role          = aws_iam_role.lambda_layer_cleanup.arn
  handler       = "PLACEHOLDER"
  runtime       = "nodejs22.x"
  filename      = "PLACEHOLDER.zip"
  lifecycle {
    ignore_changes = all
  }
}
