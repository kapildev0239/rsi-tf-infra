resource "azurerm_resource_group" "tf_state_india" {
  name     = "tf-state-rg-india"
  location = "West India"
}

resource "azurerm_storage_account" "tfc_storage" {
  name                     = "tfc4645957858"
  resource_group_name      = azurerm_resource_group.tf_state_india.name
  location                 = azurerm_resource_group.tf_state_india.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "hello_container" {
  name                  = "helloc"
  storage_account_name  = azurerm_storage_account.tfc_storage.name
  container_access_type = "private"
}