variable "Project1_Name" {
  description = "The prefix which should be used for all resources in this example"
  default = "Wipro"
}


variable "Project1_Location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "eastus"
}

variable "VNet1_AddressPrefix" {
  default = "10.0.0.0/16"
}


variable "VNet1_Subnet1_AddressPrefix" {
  default = "10.0.0.0/16"
}

variable "VNet1_Subnet2_AddressPrefix" {
  default = "10.0.1.0/24"
}

variable "VM1_Size" {}
variable "VM1_Username" {}
variable "VM1_Password" {}
variable "VM1_Datadisk_Type" {}
variable "VM1_Datadisk_Size" {}
variable "VM1_OSDisk_Type" {}
variable "VM1_OSDisk_Size" {}
variable "vm_private_ip" {}

variable "LBSKU" {}
variable  "LBName" {}
variable "private_ip" {}

variable "env" {
  default="Static"
}