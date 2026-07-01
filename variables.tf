# https://developer.hashicorp.com/terraform/language/values/variables
# https://developer.hashicorp.com/terraform/language/providers
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

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
  description = "Azure Region für die Resource Group und Storage Account"
  type        = string
  default     = "austriaeast"
}

variable "resource_group_name" {
  description = "Name der Azure Resource Group"
  type        = string
  default     = "rg-cloud-programming"
}

variable "storage_account_name" {
  description = "Name des Azure Storage Accounts (muss global eindeutig sein, nur Kleinbuchstaben und Zahlen)"
  type        = string
  default     = "stcloudprog92012248"
}

variable "dns_record_name" {
  description = "Subdomain für die Website"
  type        = string
  default     = "cloud"
}