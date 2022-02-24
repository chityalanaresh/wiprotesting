
resource "azurerm_virtual_network" "Vnet1-eastus" {
  name                = "Vnet1-${var.Project1_Name}-${var.Project1_Location}"
  location            = azurerm_resource_group.Wipro_RG1.location
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  address_space       = var.VNet1_AddressPrefix

   tags = {
    environment = "Testing"
  }
}

resource "azurerm_subnet" "Subnet1-eastus" {
  name                 = "Subnet1-${azurerm_virtual_network.Vnet1-eastus.name}"
  virtual_network_name = azurerm_virtual_network.Vnet1-eastus.name
  resource_group_name  = azurerm_resource_group.Wipro_RG1.name
  address_prefixes     = var.VNet1_Subnet1_AddressPrefix
}

resource "azurerm_subnet" "Subnet2-eastus" {
  name                 = "Subnet2-${azurerm_virtual_network.Vnet1-eastus.name}"
  virtual_network_name = azurerm_virtual_network.Vnet1-eastus.name
  resource_group_name  = azurerm_resource_group.Wipro_RG1.name
  address_prefixes     = var.VNet1_Subnet2_AddressPrefix
}
