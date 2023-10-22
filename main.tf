resource "azurerm_resource_group" "rg-kubernets" {
  name     = "rg-kubernets"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "kube_teste" {
  name                = "example-aks1"
  location            = azurerm_resource_group.rg-kubernets.location
  resource_group_name = azurerm_resource_group.rg-kubernets.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  
  value = azurerm_kubernetes_cluster.kube_teste.kube_config_raw

  sensitive = true
}

 