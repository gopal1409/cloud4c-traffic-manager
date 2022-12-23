##traffic manager profile
resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                   = "mytfdemo-${random_string.myrandom.id}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "mytfdemo-${random_string.myrandom.id}"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = local.common_tags
}

#traffic manager endpoint- project1-eastus

resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoing_project1" {
  name                = "tm-endpoint-project1"
  #resource_group_name = azurerm_resource_group.rg.name
  profile_id        = azurerm_traffic_manager_profile.tm_profile.id
  target_resource_id               = data.terraform_remote_state.project1_eastus.outputs.web_lb_public_ip_address_id
  #type                = "azureEndpoints"
  weight              = 50
}
#traffic manager endpoint- project2-eastus
resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoing_project2" {
  name                = "tm-endpoint-project2"
  #resource_group_name = azurerm_resource_group.rg.name
  profile_id        = azurerm_traffic_manager_profile.tm_profile.id
  target_resource_id              = data.terraform_remote_state.project2_eastus.outputs.web_lb_public_ip_address_id
  #type                = "azureEndpoints"
  weight              = 50
}