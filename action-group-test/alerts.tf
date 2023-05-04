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

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

resource "azurerm_monitor_activity_log_alert" "windows_restart_vm" {
  #  count               = var.vm_type == "windows" ? 1 : 0
  name                = "alert-restartvm"
  resource_group_name = azurerm_resource_group.action-group-rg.name
  scopes              = [data.azurerm_subscription.current.id]

  criteria {
    # resource_id    = azurerm_windows_virtual_machine
    operation_name = "Microsoft.Compute/virtualMachines/restart/action"
    category       = "ResourceHealth"
    status         = "succeeded"
    level          = "Critical"

  }
  action {
    action_group_id = azurerm_monitor_action_group.action-group.id
  }
}
