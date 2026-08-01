parent_rgs = {
  rg1 = {
    name     = "rg-dev"
    location = "south india"
  }
  rg2 = {
    name     = "rg-dev-github"
    location = "south india"
  }
}

parent_vnets = {
  vnet1 = {
    name                = "vnet-dev"
    location            = "south india"
    resource_group_name = "rg-dev"
    address_space       = ["10.0.0.0/16"]
  }
}

parent_subnets = {
  subnet1 = {
    name                 = "frontendsubnet-dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsubnet-dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.3.0/26"]
  }
  subnet4 = {
    name                 = "appgwsubnet-dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet5 = {
    name                 = "winsubnet-dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

parent_pips = {
  pip2 = {
    name                = "backendpublicip-dev"
    resource_group_name = "rg-dev"
    location            = "south india"
    allocation_method   = "Static"
  }

  pip4 = {
    name                = "winpublicip-dev"
    resource_group_name = "rg-dev"
    location            = "south india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip5 = {
    name                = "lbpublicip-dev"
    resource_group_name = "rg-dev"
    location            = "south india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
 
}

parent_vms = {
  vm1 = {
    nic_name                        = "frontendnic-dev"
    subnet_name                     = "frontendsubnet-dev"
    pip_name                        = "frontendpublicip-dev"
    private_ip_address_allocation   = "Dynamic"
    virtual_network_name            = "vnet-dev"
    vm_name                         = "frontendvm-dev"
    resource_group_name             = "rg-dev"
    vm_location                     = "south india"
    nic_location                    = "south india"
    size                            = "Standard_D2as_v5"
    admin_username                  = "adminuser"
    admin_password                  = "ilovemyindia@2026"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "UbuntuServer"
    sku                             = "16.04-LTS"
    version                         = "latest"
    ip_configuration                = "frontend-vmipconfig"
  }
  vm2 = {
    nic_name                        = "backendnic-dev"
    subnet_name                     = "backendsubnet-dev"
    pip_name                        = "backendpublicip-dev"
    private_ip_address_allocation   = "Dynamic"
    virtual_network_name            = "vnet-dev"
    vm_name                         = "backendvm-dev"
    resource_group_name             = "rg-dev"
    vm_location                     = "south india"
    nic_location                    = "south india"
    size                            = "Standard_D2as_v5"
    admin_username                  = "adminuser"
    admin_password                  = "ilovemyindia@2026"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "UbuntuServer"
    sku                             = "16.04-LTS"
    version                         = "latest"
    ip_configuration                = "backend-vmipconfig"
  }
}

parent_win_vms = {
  winvm1 = {
    nic_name                      = "winnic-dev"
    subnet_name                   = "winsubnet-dev"
    pip_name                      = "winpublicip-dev"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "vnet-dev"
    vm_name                       = "winvm-dev"
    resource_group_name           = "rg-dev"
    vm_location                   = "south india"
    nic_location                  = "south india"
    size                          = "Standard_D2s_v3"
    admin_username                = "adminuser"
    admin_password                = "P@ssw0rd123456!"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2019-Datacenter"
    version                       = "latest"
    ip_configuration              = "winvm-ipconfig"
  }
}

parent_bastions = {
  bastion1 = {
    name                 = "bastion-dev"
    location             = "south india"
    resource_group_name  = "rg-dev"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev"
    pip_name             = "bastionpublicip-dev"
    sku                  = "Standard"
  }
}

parent_lbs = {
  lb1 = {
    name                           = "lb-dev"
    location                       = "south india"
    resource_group_name            = "rg-dev"
    sku                            = "Standard"
    frontend_ip_configuration_name = "lb-frontend-ipconfig"
    pip_name                       = "lbpublicip-dev"
  }
}

parent_appgws = {
  appgw1 = {
    name                           = "appgw-dev"
    resource_group_name            = "rg-dev"
    location                       = "south india"
    sku_name                       = "Standard_v2"
    sku_tier                       = "Standard_v2"
    sku_capacity                   = 2
    gateway_ip_configuration_name  = "appgw-ip-config"
    subnet_name                    = "appgwsubnet-dev"
    virtual_network_name           = "vnet-dev"
    frontend_port_name             = "appgw-frontend-port"
    frontend_port                  = 80
    frontend_ip_configuration_name = "appgw-frontend-ipconfig"
    pip_name                       = "appgwpublicip-dev"
    backend_address_pool_name      = "appgw-backend-pool"
    backend_http_settings_name     = "appgw-backend-http-settings"
    cookie_based_affinity          = "Disabled"
    path                           = "/"
    backend_port                   = 80
    backend_protocol               = "Http"
    request_timeout                = 60
    http_listener_name             = "appgw-listener"
    listener_protocol              = "Http"
    request_routing_rule_name      = "appgw-routing-rule"
    rule_type                      = "Basic"
    priority                       = 1
  }
}

parent_key_vaults = {
  kv1 = {
    name                        = "kv-dev-2027"
    location                    = "south india"
    resource_group_name         = "rg-dev"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }
}
