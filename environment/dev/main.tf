module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  pips       = var.pips
}

module "linux_virtual_machine" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../module/azurerm_linux_virtual_machine"
  vms        = var.vms
}

module "windows_virtual_machine" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../module/azurerm_windows_virtual_machine"
  win_vms    = var.win_vms
}

module "bastion_host" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../module/azurerm_bastion_host"
  bastions   = var.bastions
}

module "lb" {
  depends_on = [module.public_ip]
  source     = "../../module/azurerm_lb"
  lbs        = var.lbs
}

module "application_gateway" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../module/azurerm_application_gateway"
  appgws     = var.appgws
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}