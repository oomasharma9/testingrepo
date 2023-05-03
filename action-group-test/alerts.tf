resource "azurerm_monitor_metric_alert" "SA alert" {
  name                = "alert-cpupercentage"
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
