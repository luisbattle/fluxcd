provider "azurerm" {
  features {}
}

# si se desea crear el resource group utilizar este bloque
# resource "azurerm_resource_group" "example" {
#   name     = "${var.prefix}-k8s-resources"
#   location = var.location
# }

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.prefix}-k8s"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2S" # 2 vcpus, 4 GiB memory
  }

# https://stackoverflow.com/questions/59978060/how-to-give-permissions-to-aks-to-access-acr-via-terraform
  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    oms_agent {
      enabled = false
    }
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true

  tags = {
    environment = var.environment
  }
}

# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
}
