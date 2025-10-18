module "core_eu" {
  source = "./modules/core"

  timezone                    = var.timezone_eu
  scheduler_role_arn          = aws_iam_role.scheduler.arn
  arcade_lab_contact_role_arn = aws_iam_role.arcade_lab_contact.arn
  github_actions_role_arn     = aws_iam_role.github_actions.arn

  providers = {
    aws = aws
  }
}

module "core_us" {
  source = "./modules/core"

  timezone                    = var.timezone_us
  scheduler_role_arn          = aws_iam_role.scheduler.arn
  arcade_lab_contact_role_arn = aws_iam_role.arcade_lab_contact.arn
  github_actions_role_arn     = aws_iam_role.github_actions.arn

  providers = {
    aws = aws.us
  }
}
