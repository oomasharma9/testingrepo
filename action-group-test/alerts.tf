resource "azurerm_monitor_metric_alert" "windows_cpu_percentage" {
  name                = "alert-cpupercentage"
  resource_group_name = azurerm_resource_group.action-group-rg.name
  severity            = 0
  scopes              = [azurerm_resource_group.action_group_id.id]
  description         = "Action will be triggered when Transactions count is greater than 85."
  criteria {
    metric_namespace = "microsoft.resources/subscriptions"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 85
  }

  action {
    action_group_id = azurerm_monitor_action_group.action-group.id
  }
}
