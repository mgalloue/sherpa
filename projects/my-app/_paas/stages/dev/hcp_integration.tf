# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

terraform {
  cloud {
    organization = "ansys_psi"

    workspaces {
      name = "my-app-fuji-dev-aws-eu-west-1"
    }
  }
}
