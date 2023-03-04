data "azurerm_subscription" "primary" {
    subscription_id = var.subscription_id
}

data "azuread_group" "DCODNext_group" {
  name = var.DCODNext_group_Name
}

# create custom role for resource lock management
resource "azurerm_role_definition" "DCODNext_customrole" {
  name               = var.DCODNext_customrole_name
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions     = ["Microsoft.Authorization/locks/*"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]
}

# assign custom resource lock management role on subscription sub-dev
resource "azurerm_role_assignment" "sub-dev-sg_az_sub-dev_reader_01" {
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.DCODNext_customrole.id
  
  principal_id       = data.azuread_group.DCODNext_group.id
}