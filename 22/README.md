# 22. CI/CD Tools
## HomeWork

Create a virtual machine in your choise of cloud. 
Use configuration managment (ansible) to : 
* Update packages
* Install java 
* Install docker 
* Create user "Jenkins" 
* Create directory /opt/jenkins with jenkins:jenkins as owner:group
* Upload public ssh key to /home/jenkins/.ssh/authorized_keys
* Set ssh keys in jenkins server credentials storage 
* Set up a new runner node for jenkins server on the machine. 
* Run a pipeline on that runner (agent). build and push docker to the registry.
