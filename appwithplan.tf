resource "azurerm_service_plan" "oceantempplan" {
  name                = "oceantempplan"
  resource_group_name = azurerm_resource_group.oceantemprg.name
  location            = azurerm_resource_group.oceantemprg.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "oceantempapp" {
  name                = "oceantempapp"
  resource_group_name = azurerm_resource_group.oceantemprg.name
  location            = azurerm_service_plan.oceantemprg.location
  service_plan_id     = azurerm_service_plan.oceantempplan.id

  site_config {}
}