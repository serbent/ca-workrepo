# Cloud computing.

## Excercise 01 
1. Create 3 VMs in 3 different regions Asia, Us, Europe(Poland).
2. Ping each VM. Note the differene in avarate responce time. 

## Excercise 02
1. Create a VM. 
2. Create a DB server of your choice (PostgreSQL recommended. Select "Development" workload type).
<br> Choose "Private access (VNet Integration)"
3. Try to access the DB from your local machine. 
4. Try to access the DB from the VM you've created.

## Extra 03
1. Create 3 VMs 
2. Configure nginx on all of them. 
3. Place index.html with the content: 
```
<html><title>N</title><body>This is the server N</body></html>
```
Replace the "N" with a number from 1 to 3. Different number for different server. 
4. Place a LoadBalancer in front of the Virtual Network. 
5. Configure LoadBalancer to forward the traffic to the 3 VM. 
6. Try accessing VM. Note the results
