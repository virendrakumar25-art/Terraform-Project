variable "lbs" {
  type = map(any)
}

resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = lookup(each.value, "sku", "Standard")

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = lookup(each.value, "pip_name", null) != null ? data.azurerm_public_ip.pip[each.key].id : null
  }
}
