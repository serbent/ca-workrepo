# Kubernetes with minikube 
## Accessing the application 
### Port forward to the port: 
#### Get the pod
`kubectl get po`
#### Forward the port(s)
`kubectl port-forward <pod-name> <local-port1>:<container-port1> <local-port2>:<container-port2>`

#### Access the application 
You now can access the application on `localhost:<local-port>`

### Using service
Create a service. 
Execute `minikube ip` to get the IP.
Execute `kubectl get svc` to get the NodePort that the application is running. 
Now you can access the application on `MinikubeIP:NodePort`.
