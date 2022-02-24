resource "azurerm_lb" "WiproLB" {
  name                = var.LBName
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  location            = azurerm_resource_group.Wipro_RG1.location
  sku                 = var.LBSKU

  frontend_ip_configuration {
    name                          = "${var.LBName}_frontend"
    subnet_id                     =  azurerm_subnet.Subnet1-eastus.id
    private_ip_address            = "${var.env=="Static"? var.private_ip: null}"
    private_ip_address_allocation = "${var.env=="Static"? "Static": "Dynamic"}"
  }
  
depends_on = [azurerm_subnet.Subnet1-eastus]
}

resource "azurerm_lb_rule" "WiproLB" {
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  loadbalancer_id                = azurerm_lb.WiproLB.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "${var.LBName}_frontend"
}

resource "azurerm_lb_probe" "WiproLB" {
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  loadbalancer_id     = azurerm_lb.WiproLB.id
  name                = "RDPprobe"
  port                = 3389
}

resource "azurerm_lb_backend_address_pool" "WiproLB" {
  loadbalancer_id = azurerm_lb.WiproLB.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "WiproLB" {
  name                    = "Backend"
  backend_address_pool_id = azurerm_lb_backend_address_pool.WiproLB.id
  virtual_network_id      = azurerm_virtual_network.Vnet1-eastus.id
  ip_address              = var.vm_private_ip

}




