## Resource Group Name
Project1_Name = "Wipro"
Project1_Location = "eastus"

##Vnet Info

VNet1_AddressPrefix = ["10.0.0.0/16"]
VNet1_Subnet1_AddressPrefix =  ["10.0.0.0/24"]
VNet1_Subnet2_AddressPrefix =  ["10.0.1.0/24"]


##VM Info
VM1_Size = "Standard_b1s"
VM1_Username = "azure-admin"
VM1_Password = "zaq1xsw2cde3!@#$"
VM1_OSDisk_Type = "StandardSSD_LRS"
VM1_OSDisk_Size = 128
VM1_Datadisk_Type = "StandardSSD_LRS"
VM1_Datadisk_Size = 128
vm_private_ip = "10.0.0.7"

##LB Info
LBName = "WiproLB1"
LBSKU =  "standard"
private_ip = "10.0.0.6"