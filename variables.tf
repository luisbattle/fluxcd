variable "environment" {
  default = "testing"
}
variable "prefix" {
  description = "A prefix used for all resources in this example"
  default     = "devops"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "eastus2"
}

variable "resource_group_name" {
  default = "aks_test_luis"
}
variable "registry_name" {
  default = "registrydevopsaa"
}
