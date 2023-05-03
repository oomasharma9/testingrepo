data "azurerm_subscription" "current" {
}

resource "azurerm_monitor_metric_alert" "windows_cpu_percentage" {
  count               = var.vm_type == "windows" ? 1 : 0
  name                = "alert-cpupercentage"
  resource_group_name = azurerm_resource_group.action-group-rg
  severity            = 0
  scopes              = data.azurerm_subscription.current.id
  description         = "Action will be triggered when Transactions count is greater than 85."
  criteria {
    metric_namespace = "microsoft.resources/subscriptions"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 85
  }
  dynamic "action" {
    content {
      action_group_id = data.azurerm_monitor_action_group.action_group_id.id
    }
  }
}
