# Terraform Konfig
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

# Azure Konfig
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}
}

# Cloudflare Konfig
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

# Azure Static Web App
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app
resource "azurerm_static_web_app" "swa" {
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"
}

# Cloudflare DNS Record
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "website" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name
  value   = azurerm_static_web_app.swa.default_host_name
  type    = "CNAME"
  proxied = true
}