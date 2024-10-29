output public_ip_address {
  value       = azurerm_linux_virtual_machine.calecture27.public_ip_address
  sensitive   = false
  description = "Puclic IP Adress for virtual machine"
  depends_on  = []
}
