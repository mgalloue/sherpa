# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

data "aws_secretsmanager_secret_version" "acr_pull" {
  secret_id = var.container_registry_token_secret_arn
}

data "aws_eks_cluster" "eks" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = local.cluster_name
}

data "aws_secretsmanager_secret_version" "kc_credentials" {
  secret_id = local.ansys_iam_tf_credentials_secret_arn
}

data "aws_secretsmanager_secret_version" "tf_service_account_secret_arn" {
  secret_id = var.tf_service_account_secret_arn
}

locals {
  tf_service_account_secret = jsondecode(data.aws_secretsmanager_secret_version.tf_service_account_secret_arn.secret_string)
  kc_credentials            = jsondecode(data.aws_secretsmanager_secret_version.kc_credentials.secret_string)
  acr_pull                  = jsondecode(data.aws_secretsmanager_secret_version.acr_pull.secret_string)
}
