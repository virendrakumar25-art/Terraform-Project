data "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.lbs : k => v if lookup(v, "pip_name", null) != null }
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
