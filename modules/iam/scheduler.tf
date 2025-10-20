resource "aws_iam_role" "scheduler" {
  name = "SchedulerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }]
  })

  tags = {
    "application" = "lambda-functions"
  }
}

resource "aws_iam_role_policy_attachment" "scheduler_lambda_invoke_policy" {
  role       = aws_iam_role.scheduler.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}
