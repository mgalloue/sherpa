# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

terraform {
  cloud {
    organization = "ansys_psi"

    workspaces {
      name = "my-app-fuji-test-aws-eu-west-1"
    }
  }
}
