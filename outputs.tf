# Outputs nach Deployment
# https://developer.hashicorp.com/terraform/language/values/outputs

output "storage_account_url" {
  description = " URL Azure Storage Static Website Endpoints"
  value       = azurerm_storage_account.storage.primary_web_endpoint
}

output "custom_domain_url" {
  description = "URL Cloudflare"
  value       = "https://${var.dns_record_name}.trappeonline.xyz"
}

output "resource_group_name" {
  description = "Azure Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Storage Account"
  value       = azurerm_storage_account.storage.name
}