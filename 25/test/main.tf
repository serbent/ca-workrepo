variable environment { 
    type = string 
    default = "test"
}


module test {
    source = "../modules"
    region = "polandcentral"
    resource_group_name = "test_rsgp"
    virtual_network_name = "test_vpc"
    subnet_name = "testsubnet"
    vm_name =  "${var.environment}-catest001"
    machine_size = "Standard_B1s"
}