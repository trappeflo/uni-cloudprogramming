# https://developer.hashicorp.com/terraform/language/manage-sensitive-data
# https://developer.hashicorp.com/terraform/language/providers
variable "cloudflare_api_token" {
  description = "Cloudflare API Token für DNS-Verwaltung"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Zone ID der Domain trappeonline.xyz in Cloudflare"
  type        = string
}

variable "location" {
  description = "Azure Region für die Resource Group"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name der Azure Resource Group"
  type        = string
  default     = "rg-cloud-programming"
}

variable "static_web_app_name" {
  description = "Name der Azure Static Web App"
  type        = string
  default     = "swa-cloud-programming"
}

variable "dns_record_name" {
  description = "Subdomain für die Website"
  type        = string
  default     = "cloud"
}