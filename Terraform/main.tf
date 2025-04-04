terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Generate a random suffix for unique app names
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

#  Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# App Service Plan
resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

#  App Service (Now references `random_string.suffix.result` correctly)
resource "azurerm_app_service" "app" {
  name                = "myapp-terraform-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.plan.id

  depends_on = [azurerm_service_plan.plan]
}

#  Deployment Slot
resource "azurerm_app_service_slot" "slot" {
  name                = var.deployment_slot_name
  app_service_name    = azurerm_app_service.app.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  app_service_plan_id = azurerm_service_plan.plan.id

  depends_on = [azurerm_app_service.app]
}
