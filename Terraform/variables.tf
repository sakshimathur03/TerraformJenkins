variable "location" {
  type    = string
  default = "East US" # Change if your subscription restricts this region
}

variable "resource_group_name" {
  type    = string
  default = "rg-jenkins"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-my-app"
}

variable "app_service_name" {
  type    = string
  default = "MyAppTerraform"
}

variable "deployment_slot_name" {
  type    = string
  default = "staging-slot" # Ensure it follows Azure naming rules
}
