```
az group create --name MyPolandResourceGroup --location polandcentral
az network vnet create \
    --resource-group MyPolandResourceGroup \
    --name MyVNet \
    --subnet-name MySubnet

az vm create \
    --resource-group MyPolandResourceGroup \
    --name VM1 \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys

az vm create \
    --resource-group MyPolandResourceGroup \
    --name VM2 \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --generate-ssh-keys

az vm create \
    --resource-group MyPolandResourceGroup \
    --name VM3 \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --generate-ssh-keys
```