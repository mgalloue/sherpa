# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

variable "default_tags" {
  type        = map(string)
  description = "The default tags to apply to all resources in the environment."
  default     = {}
}

variable "my-app_config" {
  description = "Configuration for the my-app app layer."
  type = object({
    namespace        = string
    base_domain_name = string
    realm_name       = optional(string, "ansys")
    registry_name    = optional(string, "azwepsifujiaksacr.azurecr.io")
    base_path        = optional(string, "/auth")

    create_service_account = bool
    user_emails            = list(string)
    ca_bundle_name         = string
    subdomains             = optional(list(string), [])
    enable_idp_token_exchange = optional(bool, false)
    valid_redirect_uri_suffix = optional(string, "")
  })
}
