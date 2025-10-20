resource "aws_iam_role" "lambda_layer_cleanup" {
  name = "LambdaLayerCleanupRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  tags = {
    "application" = "lambda-functions"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_layer_cleanup_basic_exec_policy" {
  role       = aws_iam_role.lambda_layer_cleanup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_layer_policy" {
  name = "LambdaLayerPolicy"
  role = aws_iam_role.lambda_layer_cleanup.id

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "ListDeleteLambdaLayers",
        "Effect" : "Allow",
        "Action" : [
          "lambda:DeleteLayerVersion",
          "lambda:ListLayerVersions",
          "lambda:ListLayers"
        ],
        "Resource" : "*"
      }
    ]
  })
}
