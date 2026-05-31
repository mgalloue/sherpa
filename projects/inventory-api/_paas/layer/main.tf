# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

module "inventory-api" {
  source  = "app.terraform.io/ansys_psi/app-layer-setup/psi"
  version = "0.1.1"

  namespace                           = var.inventory-api_config.namespace
  base_domain_name                    = var.inventory-api_config.base_domain_name
  env_domain                          = local.env_domain
  env_short_name                      = var.env_short_name
  ansys_iam_domain                    = local.ansys_iam_domain
  container_registry_token_secret_arn = var.container_registry_token_secret_arn

  create_service_account   = var.inventory-api_config.create_service_account
  user_emails              = var.inventory-api_config.user_emails
  ca_bundle_name           = var.inventory-api_config.ca_bundle_name
  use_private_route53_zone = var.use_private_route53_zone
  subdomains              = var.inventory-api_config.subdomains

  providers = {
    keycloak.cluster_access = keycloak.cluster_access
  }
}
