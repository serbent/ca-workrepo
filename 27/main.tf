resource "azurerm_resource_group" "calecture27" {
  name     = "${var.resource_group_name}-${terraform.workspace}"
  location = var.region
}

resource "azurerm_virtual_network" "calecture27" {
  name                = "${var.virtual_network_name}-${terraform.workspace}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.calecture27.location
  resource_group_name = azurerm_resource_group.calecture27.name
}

resource "azurerm_subnet" "calecture27" {
  name                 = "${var.subnet_name}-${terraform.workspace}"
  resource_group_name  = azurerm_resource_group.calecture27.name
  virtual_network_name = azurerm_virtual_network.calecture27.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "calecture27" {
  name                = "calecture27-nic-${terraform.workspace}"
  location            = azurerm_resource_group.calecture27.location
  resource_group_name = azurerm_resource_group.calecture27.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.calecture27.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "calecture27" {
  name                = "${var.vm_name}${terraform.workspace}"
  resource_group_name = azurerm_resource_group.calecture27.name
  location            = azurerm_resource_group.calecture27.location
  size                = var.machine_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.calecture27.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}