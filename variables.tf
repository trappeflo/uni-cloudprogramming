# https://developer.hashicorp.com/terraform/language/manage-sensitive-data
# https://developer.hashicorp.com/terraform/language/providers
variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
  default     = "rg-cloud-programming"
}

variable "static_web_app_name" {
  description = "Azure Static Web App"
  type        = string
  default     = "swa-cloud-programming"
}

variable "dns_record_name" {
  description = "Subdomain"
  type        = string
  default     = "cloud"
}