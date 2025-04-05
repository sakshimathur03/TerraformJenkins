

variable "location" {
    description = "location of service"
    type = string
    default = "eastus2"
}
variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = "rg-jenkins"
}

variable "os" {
  description = "Operating system"
  type = string
  default = "Linux"
}

variable "service_plan_name" {
  description = "Name of the service plan"
  type = string
  default = "myappserviceplan"
}

variable "sku_name" {
  description = "Pricing plan of the azure service plan"
  type = string
  default = "Free"
}

variable "linux_web_app_name" {
  description = "name of the app service"
  type = string
  default = "webapijenkins3425"
}
variable "pricing_plan" {
  description = "Pricing plan of the azure service plan"
  type = string
  default = "F1"
}

variable "linux_web_app_slot_name" {
  description = "name of windows web app slot"
  type = string
  default = "winappslotSakshi"
}
