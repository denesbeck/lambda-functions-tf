output "scheduler_role_arn" {
  value = aws_iam_role.scheduler.arn
}

output "layer_cleanup_role_arn" {
  value = aws_iam_role.lambda_layer_cleanup.arn
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}

output "arcade_lab_contact_role_arn" {
  value = module.apps.arcade_lab_contact_role_arn
}
