module "core_eu" {
  source = "./modules/core"

  timezone                    = var.timezone_eu
  scheduler_role_arn          = module.iam.scheduler_role_arn
  layer_cleanup_role_arn      = module.iam.layer_cleanup_role_arn
  arcade_lab_contact_role_arn = module.iam.arcade_lab_contact_role_arn
  github_actions_role_arn     = module.iam.github_actions_role_arn

  providers = {
    aws = aws
  }
}

module "core_us" {
  source = "./modules/core"

  timezone                    = var.timezone_us
  scheduler_role_arn          = module.iam.scheduler_role_arn
  layer_cleanup_role_arn      = module.iam.layer_cleanup_role_arn
  arcade_lab_contact_role_arn = module.iam.arcade_lab_contact_role_arn
  github_actions_role_arn     = module.iam.github_actions_role_arn

  providers = {
    aws = aws.us
  }
}

module "iam" {
  source = "./modules/iam"

  lambda_functions_repo = var.lambda_functions_repo
  s3_resources_eu       = module.core_eu.s3_resources
  s3_resources_us       = module.core_us.s3_resources

  providers = {
    aws.eu = aws
    aws.us = aws.us
  }
}
