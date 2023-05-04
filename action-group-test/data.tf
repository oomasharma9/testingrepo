data "azurerm_resource_group" "infra_resource_group" {
  name = var.infra_resource_group_name
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.infra_resource_group_name
}

data "azurerm_client_config" "current" {
}


data "azurerm_key_vault" "shared_hub_sc_keyvault" {
  provider            = azurerm.az-shared-hub
  name                = "kv-sc-platform-weu-2e69"
  resource_group_name = "rg-sc-platform-prod-weu-001"
}

data "azurerm_storage_account" "packages_sc" {
  provider = azurerm.az-shared-hub
  #provider           = azurerm.az-scatalog-nonprod
  name = "stscplatformrepo"
  #resource_group_name = "rg-scatalog-platform-nonprod-weu-001"
  resource_group_name = "rg-sc-platform-prod-weu-001"
}


data "azurerm_key_vault_secret" "windows_password" {
  count        = var.vm_type == "windows" ? 1 : 0
  provider     = azurerm.az-shared-hub
  name         = "vm-windows-password"
  key_vault_id = data.azurerm_key_vault.shared_hub_sc_keyvault.id
}

data "azurerm_key_vault_secret" "linux_public_key" {
  count        = var.vm_type == "linux" ? 1 : 0
  provider     = azurerm.az-shared-hub
  name         = "linux-vm-public-key"
  key_vault_id = data.azurerm_key_vault.shared_hub_sc_keyvault.id
}


data "azurerm_log_analytics_workspace" "log_shared_workspace" {
  provider            = azurerm.az-shared-hub
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_resource_group_name
}

/*data "azurerm_monitor_action_group" "action_group" {
  count               = var.action_group_present == true ? 1 : 0
  resource_group_name = var.infra_resource_group_name
  name                = var.action_group_name
}*/