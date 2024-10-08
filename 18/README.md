# Azure CLI

## Excercise 01
 Create a bash script to:
1. Create a VM in existing Resource Group (RG). 
2. If RG does not exist - create 
3. Check the status of the created VM. 
4. If the status is "stopped" - start the VM. 
5. Script should check the status of the VM periodicaly (every 45s). 
6. Script should log the status of the actions and VM status. 
7. Stop the VM from another terminal window. 
8. Observe the work of the script. 
9. Check the logs.
10. All log entries should have timestamp.

Hints: 
Use bash functions

## Excercise 02
Create a script to:
1. Create a RG if it doesn't exist
2. Create a virtual network. 
3. Create a public IP 
4. Create a backend pool
5. Create Load Balancer(LB)
6. Create a health probe
7. Create a LB rule
8. Add 3 VM to the Backend Pool. 

Stuff that will be needed:
```
az group
az network vnet
az network public-ip
az network lb address-pool
az network lb
az network lb probe
az network lb rule
az network nic ip-config address-pool
```

