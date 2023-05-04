/*resource "azurerm_monitor_metric_alert" "example" {
  name                = "example-metricalert"
  resource_group_name = azurerm_resource_group.action-group-rg.name
  severity            = 0
  scopes              = [azurerm_storage_account.test.id]
  description         = "Action will be triggered when Transactions count is greater than 85."
  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Transactions"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 85
  }

  action {
    action_group_id = azurerm_monitor_action_group.action-group.id
  }
}
*/

resource "azurerm_monitor_activity_log_alert" "windows_restart_vm" {
  #  count               = var.vm_type == "windows" ? 1 : 0
  name                = "alert-restartvm"
  resource_group_name = azurerm_resource_group.action-group-rg.name
  scopes              = [azurerm_windows_virtual_machine.main.id]

  criteria {
    resource_id    = azurerm_windows_virtual_machine.main.id
    operation_name = "Microsoft.Compute/virtualMachines/restart/action"
    category       = "Administrative"
    status         = "succeeded"
    level          = "Verbose"

  }
  action {
    action_group_id = azurerm_monitor_action_group.action-group.id
  }
}
