data "azurerm_public_ip" "public_ip" {
  for_each            = var.child_lbs
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
