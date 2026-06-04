# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

terraform {
  cloud {
    organization = "ansys_psi"

    workspaces {
      name = "inventory-api-fuji-dev-aws-eu-west-1"
    }
  }
}
