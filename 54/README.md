# Consultations. Mock project
## Task
### Infa
Setup CI/CD for infrastructure. 
Create a VM using terraform (with all the required components, VPC, SG, IAM, Buckets)

### Server config
Create an ansible playbook to prepare the VM to run docker containers. 
Create a CI/CD pipeline for it.

### Deployment
Create a CI/CD to deploy [gatus](https://github.com/TwiN/gatus/tree/master) on the VM we've created.

### Gatus config
Create a CI/CD pipeline that would update gatus configuration. 
(when gatus configuration file changes - fire up CI/CD to update the config on the server)