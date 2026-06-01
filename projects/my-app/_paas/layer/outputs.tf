# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

output "my-app_urls" {
  description = "Public HTTPS URLs for the my-app service"
  value       = module.my-app.app_urls
}

output "my-app_namespace" {
  description = "Kubernetes namespace for my-app"
  value       = module.my-app.namespace
}
