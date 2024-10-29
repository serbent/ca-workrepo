resource "azurerm_virtual_network" "calecture27" {
  name                = "moduleexample"
  address_space       = ["10.0.0.0/16"]
  location            = "polandcentral"
  resource_group_name = "MyPolandResourceGroup"
}

resource "azurerm_subnet" "calecture27" {
  name                 = "moduleexample"
  resource_group_name  = "MyPolandResourceGroup"
  virtual_network_name = azurerm_virtual_network.calecture27.name
  address_prefixes     = ["10.0.2.0/24"]
}

module "virtual-machine" {
  source  = "Azure/virtual-machine/azurerm"
  version = "1.1.0"
  image_os = "linux"
  location = "polandcentral"
  name = "modulevm1"
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  resource_group_name = "MyPolandResourceGroup"
  size = "Standard_B1s"
  subnet_id = azurerm_subnet.calecture27.id
  os_simple = "UbuntuServer"
}