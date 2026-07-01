# Outputs nach  Deployment
# https://developer.hashicorp.com/terraform/language/values/outputs

output "static_web_app_url" {
  description = "Die URL der Azure Static Web App"
  value       = "https://${azurerm_static_web_app.swa.default_host_name}"
}

output "custom_domain_url" {
  description = "Cloudflare URL"
  value       = "https://${var.dns_record_name}.trappeonline.xyz"
}

output "resource_group_name" {
  description = "Azure Resource Group"
  value       = azurerm_resource_group.rg.name
}