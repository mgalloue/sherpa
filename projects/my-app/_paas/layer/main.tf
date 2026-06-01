# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

module "my-app" {
  source  = "app.terraform.io/ansys_psi/app-layer-setup/psi"
  version = "0.1.1"

  namespace                           = var.my-app_config.namespace
  base_domain_name                    = var.my-app_config.base_domain_name
  env_domain                          = local.env_domain
  env_short_name                      = var.env_short_name
  ansys_iam_domain                    = local.ansys_iam_domain
  container_registry_token_secret_arn = var.container_registry_token_secret_arn

  create_service_account   = var.my-app_config.create_service_account
  user_emails              = var.my-app_config.user_emails
  ca_bundle_name           = var.my-app_config.ca_bundle_name
  use_private_route53_zone = var.use_private_route53_zone

  providers = {
    keycloak.cluster_access = keycloak.cluster_access
  }
}
