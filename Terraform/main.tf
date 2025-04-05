provider "azurerm" {
  features {}
  subscription_id = "3354a426-5b85-4323-9efe-9581e63d9653"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Add a delay to allow Azure to propagate the resource group creation
resource "time_sleep" "wait_after_rg" {
  depends_on = [azurerm_resource_group.rg]
  create_duration = "30s"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.os_type
  sku_name            = var.sku_name

  depends_on = [time_sleep.wait_after_rg]
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = true
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
