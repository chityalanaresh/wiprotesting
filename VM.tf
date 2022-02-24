resource "azurerm_windows_virtual_machine" "VM1-WiproRG-eastus" {
  name                = "VM1_${var.Project1_Name}${var.Project1_Location}"
  computer_name = "Wiprotestvm"
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  location            = azurerm_resource_group.Wipro_RG1.location
  size                = var.VM1_Size
  admin_username      = var.VM1_Username
  admin_password      = var.VM1_Password
  network_interface_ids = [
    azurerm_network_interface.NIC1-VM1-eastus.id,
  ]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = var.VM1_OSDisk_Type
    caching              = "ReadWrite"
    name                 = "OSDisk-VM1${var.Project1_Name}${var.Project1_Location}"
    disk_size_gb         = var.VM1_OSDisk_Size

  }
}

resource "azurerm_managed_disk" "VM_Datadisk" {
  name                 = "DataDisk-VM1${var.Project1_Name}${var.Project1_Location}"
  location             = azurerm_resource_group.Wipro_RG1.location
  resource_group_name  = azurerm_resource_group.Wipro_RG1.name
  create_option = "Empty"
  storage_account_type = var.VM1_Datadisk_Type
  disk_size_gb         = var.VM1_Datadisk_Size
}

resource "azurerm_virtual_machine_data_disk_attachment" "VMDatadisk" {
  managed_disk_id    = azurerm_managed_disk.VM_Datadisk.id
  virtual_machine_id = azurerm_windows_virtual_machine.VM1-WiproRG-eastus.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_network_interface" "NIC1-VM1-eastus" {
  name = "NIC1-VM1${var.Project1_Name}${var.Project1_Location}"
  resource_group_name = azurerm_resource_group.Wipro_RG1.name
  location            = azurerm_resource_group.Wipro_RG1.location

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "static"
    private_ip_address = var.vm_private_ip
    subnet_id                     = azurerm_subnet.Subnet1-eastus.id

  }
}