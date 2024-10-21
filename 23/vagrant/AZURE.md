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
    --image Ubuntu2204 \
    --admin-username azureuser \
    --ssh-key-value ~/.ssh/id_ed25519.pub

az vm create \
    --resource-group MyPolandResourceGroup \
    --name VM2 \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --ssh-key-value ~/.ssh/id_ed25519.pub

az vm create \
    --resource-group MyPolandResourceGroup \
    --name VM3 \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --ssh-key-value ~/.ssh/id_ed25519.pub
```