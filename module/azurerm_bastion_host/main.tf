resource "azurerm_bastion_host" "bastion_host" {
  for_each            = var.child_bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = lookup(each.value, "sku", "Standard")

  ip_configuration {
    name                 = lookup(each.value, "ip_configuration_name", "bastion-ipconfig")
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
  }
}
