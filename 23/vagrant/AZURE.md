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

# Resize the machines if nessesary

```
az vm deallocate --resource-group MyPolandResourceGroup --name VM1

az vm resize --resource-group MyPolandResourceGroup --name VM1 --size Standard_B1s

az vm start --resource-group MyPolandResourceGroup --name VM1
```
