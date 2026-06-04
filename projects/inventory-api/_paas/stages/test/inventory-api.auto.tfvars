# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

inventory-api_config = {
  namespace        = "inventory"
  base_domain_name = "inventory"

  user_emails            = ["bob@synopsys.com", "mgalloue@synopsys.com", "qa@synopsys.com"]
  ca_bundle_name         = "ansys-bundle"
  create_service_account = true
  subdomains             = ["inventory-admin"]
}
