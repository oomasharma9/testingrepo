/*resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                      = var.vm_type == "windows" ? 1 : 0
  name                       = var.vm_name
  location                   = data.azurerm_resource_group.rg.location
  resource_group_name        = var.resource_group_name
  encryption_at_host_enabled = true
  zone                       = var.zone


  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size
  admin_username        = var.vm_user
  admin_password        = "testing123"

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  dynamic "plan" {
    for_each = toset(local.vm_plan != null ? [1] : [])
    content {
      name      = lookup(local.vm_plan, "name", null)
      product   = lookup(local.vm_plan, "product", null)
      publisher = lookup(local.vm_plan, "publisher", null)
    }
  }
  os_disk {
    caching              = var.vm_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.vm_os_disk_disk_size_gb
  }
  lifecycle {
    ignore_changes = [
      zone,
      admin_username
    ]
  }

}

resource "azurerm_managed_disk" "windows_data_disk" {
  count                = var.add_data_disk == true && var.vm_type == "windows" ? 1 : 0
  name                 = "${var.vm_name}-data-disk"
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_storage_account_type
  create_option        = "Empty"
  zone                 = var.zone

  disk_size_gb = var.vm_data_disk_size_gb
  lifecycle {
    ignore_changes = [
      zone
    ]
  }

}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk" {
  count              = var.add_data_disk == true && var.vm_type == "windows" ? 1 : 0
  managed_disk_id    = azurerm_managed_disk.windows_data_disk[0].id
  virtual_machine_id = azurerm_windows_virtual_machine.windows_vm[0].id
  lun                = var.vm_data_disk_lun
  caching            = var.vm_disk_caching
}

/*resource "azurerm_managed_disk" "windows_data_disk1" {
  count                = var.add_data_disk1 == true && var.vm_type == "windows" ? 1 : 0
  name                 = "${var.vm_name}-data-disk1"
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_storage_account_type1
  create_option        = "Empty"
  disk_size_gb         = var.vm_data_disk_size_gb1
  tags                 = local.tags

}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk1" {
  count              = var.add_data_disk1 == true && var.vm_type == "windows" ? 1 : 0
  managed_disk_id    = azurerm_managed_disk.windows_data_disk1[0].id
  virtual_machine_id = azurerm_windows_virtual_machine.windows_vm[0].id
  lun                = var.vm_data_disk_lun1
  caching            = var.vm_disk_caching
}

resource "azurerm_virtual_machine_extension" "windows_oms_ext" {
  count                = var.vm_type == "windows" ? 1 : 0
  name                 = "MicrosoftMonitoringAgent"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm[0].id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"
  #auto_upgrade_minor_version = true

  settings           = <<SETTINGS
    {
        "workspaceId": "${data.azurerm_log_analytics_workspace.log_shared_workspace.workspace_id}"
    }
SETTINGS
  protected_settings = <<PROTECTEDSETTINGS
    {
        "workspaceKey": "${data.azurerm_log_analytics_workspace.log_shared_workspace.primary_shared_key}"
    }
}
*/