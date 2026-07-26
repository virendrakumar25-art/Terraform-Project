variable "vms"{}
resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_configuration
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.vm_location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}