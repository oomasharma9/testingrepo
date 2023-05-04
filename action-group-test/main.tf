data "azurerm_resource_group" "rg" {
  name = var.resource_group_name

}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name

  enable_accelerated_networking = var.nic_enable_accelerated_networking

  ip_configuration {
    name                          = "${var.vm_name}-nic-ipconfig"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

locals {

  vm_plan = {
    name      = var.vm_sku
    product   = var.vm_offer
    publisher = var.vm_publisher


  }
}
