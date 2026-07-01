# Terraform Konfiguration
# https://developer.hashicorp.com/terraform/language/providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

# Azure Konfiguration
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}
}

# Cloudflare Konfiguration
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Azure Resource Group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Storage Account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  # Statische Website
  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
# HTTPS
  https_traffic_only_enabled = true
  min_tls_version           = "TLS1_2"
}

# Cloudflare DNS Record
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "website" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name
  content = azurerm_storage_account.storage.primary_web_host
  type    = "CNAME"
  proxied = true
}