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
  default = "myapp-terraform-${random_string.suffix.result}"
}

variable "deployment_slot_name" {
  type    = string
  default = "staging_slot"
}

variable "subscription_id" {
  type    = string
  default = "2f1ef4d2-8798-474f-81d1-d2fc16c553b6"
}
