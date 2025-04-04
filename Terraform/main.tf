provider "azurerm" {
  features {}
}

# Define the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "East US"
}

# Define the Service Plan (Fixed Missing Arguments)
resource "azurerm_service_plan" "plan" {
  name                = "myAppServicePlan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"    # Change to "Windows" if needed
  sku_name            = "B1"       # Example SKU: F1 (Free), B1 (Basic), P1V2 (Premium)
}

# Define the App Service
resource "azurerm_linux_web_app" "app" {
  name                = "myWebApp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = true
  }
}

# Output App Service URL
output "app_service_url" {
  value = azurerm_linux_web_app.app.default_site_hostname
}
