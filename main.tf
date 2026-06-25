resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = lower(var.location)

  tags = var.tags
}
