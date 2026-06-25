variable "resource_group_name" {
  description = "Name of the Azure Resource Group to create."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) >= 3 && length(trimspace(var.resource_group_name)) <= 90
    error_message = "Resource group name must be between 3 and 90 characters."
  }

  validation {
    condition     = can(regex("^[a-zA-Z0-9._()\\-]+$", var.resource_group_name))
    error_message = "Resource group name can contain letters, numbers, periods, underscores, hyphens, and parentheses only."
  }
}

variable "location" {
  description = "Azure region where the Resource Group will be created."
  type        = string

  validation {
    condition = contains([
      "eastus",
      "eastus2",
      "westeurope",
      "northeurope",
      "centralindia",
      "southindia",
      "westindia"
    ], lower(var.location))

    error_message = "Allowed locations are eastus, eastus2, westeurope, northeurope, centralindia, southindia, westindia."
  }
}

variable "tags" {
  description = "Tags to apply on the Resource Group."
  type        = map(string)
  default     = {}
}
