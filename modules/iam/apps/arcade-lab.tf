resource "aws_iam_role" "arcade_lab_contact" {
  name = "ArcadeLabContactRole"

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
    "application" = "arcade_lab"
  }
}

resource "aws_iam_role_policy_attachment" "arcade_lab_contact_basic_exec_policy" {
  role       = aws_iam_role.arcade_lab_contact.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_parameter_store_policy" {
  name = "LambdaParameterStorePolicy"
  role = aws_iam_role.arcade_lab_contact.id

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "AllowKmsAndSsmAccess",
        Effect : "Allow",
        Action : [
          "kms:Decrypt",
          "ssm:GetParameters"
        ],
        Resource : [
          "arn:aws:ssm:*:${data.aws_caller_identity.current.account_id}:*",
          "arn:aws:kms:eu-central-1:${data.aws_caller_identity.current.account_id}:key/${data.aws_kms_key.default_eu.id}",
          "arn:aws:kms:us-east-1:${data.aws_caller_identity.current.account_id}:key/${data.aws_kms_key.default_us.id}"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_ses_send_policy" {
  name = "LambdaSESSendPolicy"
  role = aws_iam_role.arcade_lab_contact.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "AllowSESSendFromVerifiedIdentity",
        Effect   = "Allow",
        Action   = "ses:SendEmail",
        Resource = "arn:aws:ses:*:${data.aws_caller_identity.current.account_id}:identity/*"
        Condition : {
          "StringEquals" : {
            "ses:FromAddress" : "contact@arcade-lab.io"
          }
        }
      }
    ]
  })
}
