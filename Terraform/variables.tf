variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default = "rg-jenkins"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default = "westus"
}

variable "service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default = "my-app-plan"
}

variable "sku_name" {
  description = "The SKU tier for the App Service Plan."
  type        = string
  default     = "B1" # Change as needed (e.g., F1, P1V2)
}

variable "os_type" {
  description = "The operating system for the App Service (Linux or Windows)."
  type        = string
  default     = "Linux"
}

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
  default = "MyAppTerraform"
}
