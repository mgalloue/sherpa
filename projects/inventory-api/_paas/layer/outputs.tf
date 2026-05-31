# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

output "inventory-api_urls" {
  description = "Public HTTPS URLs for the inventory-api service"
  value       = module.inventory-api.app_urls
}

output "inventory-api_namespace" {
  description = "Kubernetes namespace for inventory-api"
  value       = module.inventory-api.namespace
}
