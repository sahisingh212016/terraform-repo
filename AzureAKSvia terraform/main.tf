resource "azurerm_resource_group" "rg1" {
  name     = "${var.name}-rg"
  location = "southindia"
}

resource "azurerm_kubernetes_cluster" "clusterblock" {
  name                = "${var.name}-cluster"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  dns_prefix          = "${var.name}-cluster"

  default_node_pool {
    name       = "default"
    node_count = var.nodeexists ? 2 : 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

   tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.clusterblock.kube_config[0].client_certificate

  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.clusterblock.kube_config_raw

  sensitive = true
}