module "resource_group" {
  source    = "../../module/azurerm_resource_group"
  child_rgs = var.parent_rgs
}

module "virtual_network" {
  depends_on  = [module.resource_group]
  source      = "../../module/azurerm_virtual_network"
  child_vnets = var.parent_vnets
}

module "subnet" {
  depends_on    = [module.virtual_network]
  source        = "../../module/azurerm_subnet"
  child_subnets = var.parent_subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  child_pips = var.parent_pips
}

module "linux_virtual_machine" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../module/azurerm_linux_virtual_machine"
  child_vms  = var.parent_vms
}

module "windows_virtual_machine" {
  depends_on    = [module.public_ip, module.subnet]
  source        = "../../module/azurerm_windows_virtual_machine"
  child_win_vms = var.parent_win_vms
}

module "bastion_host" {
  depends_on     = [module.public_ip, module.subnet]
  source         = "../../module/azurerm_bastion_host"
  child_bastions = var.parent_bastions
}

module "lb" {
  depends_on = [module.public_ip]
  source     = "../../module/azurerm_lb"
  child_lbs  = var.parent_lbs
}

module "application_gateway" {
  depends_on   = [module.public_ip, module.subnet]
  source       = "../../module/azurerm_application_gateway"
  child_appgws = var.parent_appgws
}

module "key_vault" {
  depends_on       = [module.resource_group]
  source           = "../../module/azurerm_key_vault"
  child_key_vaults = var.parent_key_vaults
}