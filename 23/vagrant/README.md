# Preparation to get VMs up and running on local host with Vagrant.
## Prerequisites
Generate a new ssh keypair that can be disposable.

## Prepare the machine

1. Install Vagrant

```
# Get the keys
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the keys
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update packages and install software
sudo apt update && sudo apt install vagrant virtualbox -y
```
2. Create a directory for vagrant
``` 
mkdir ~/vagrant-vms
cd ~/vagrant-vms
```
3. Initialize Vagrant
```
vagrant init ubuntu/bionic64
```
4. Create a Vagrant file
```
Vagrant.configure("2") do |config|
  # Path to your public SSH key (modify if different)
  ssh_pub_key = File.read(File.expand_path("~/.ssh/id_ecdsa.pub"))
  # Define the first VM
  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.hostname = "vm1"
    vm1.vm.network "private_network", type: "dhcp"

    # Provision VM with the public key
    vm1.vm.provision "shell", inline: <<-SHELL
      mkdir -p /home/vagrant/.ssh
      echo '#{ssh_pub_key}' >> /home/vagrant/.ssh/authorized_keys
      chmod 600 /home/vagrant/.ssh/authorized_keys
      chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
    SHELL
  end

  # Define the second VM
  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "ubuntu/bionic64"
    vm2.vm.hostname = "vm2"
    vm2.vm.network "private_network", type: "dhcp"

    # Provision VM with the public key
    vm2.vm.provision "shell", inline: <<-SHELL
      mkdir -p /home/vagrant/.ssh
      echo '#{ssh_pub_key}' >> /home/vagrant/.ssh/authorized_keys
      chmod 600 /home/vagrant/.ssh/authorized_keys
      chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
    SHELL
  end

  # Define the third VM
  config.vm.define "vm3" do |vm3|
    vm3.vm.box = "ubuntu/bionic64"
    vm3.vm.hostname = "vm3"
    vm3.vm.network "private_network", type: "dhcp"

    # Provision VM with the public key
    vm3.vm.provision "shell", inline: <<-SHELL
      mkdir -p /home/vagrant/.ssh
      echo '#{ssh_pub_key}' >> /home/vagrant/.ssh/authorized_keys
      chmod 600 /home/vagrant/.ssh/authorized_keys
      chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
    SHELL
  end
end

```
5. Start up Vagrant

```
vagrant up
```

6. SSH into the VMs
```
vagrant ssh vm1   # Access VM1
vagrant ssh vm2   # Access VM2
vagrant ssh vm3   # Access VM3
```

7. Managing the VMs
* Get the status
```
vagrant status
```
* To suspend the VMs (saving their state to disk):
```
vagrant suspend
```
* To resume the VMs:
```
vagrant resume
```
* To halt the VMs (shutting them down):
```
vagrant halt
```
* To destroy the VMs (remove them completely):
```
vagrant destroy
```

Now you have a fleet of 3 Ubuntu VM on your host. 

## Install github agent 
1. Go to repository setting -> Actions -> Runners -> New self-hosted runner.
2. Connect to the location you want your runner to be installed. 
3. Run the commands
4. Follow the instruction on github  (1)
5. Run the runner 
```
run.sh
```

## Create an inventory. 
Get the IPs of VM by ssh'ing into them and runniing the command:
```
ip addr show enp0s8
```
Note the IP from the _inet_ line. 

# Creata a pipeline
## Create ansible playbook
1. Create an ansible playbook to install docker on all the hosts

## Create pipeline jobs
1. Create a jobs to buils and push docker image to registry.
2. Create a job to deploy that image to VMs. Use ansible for deployment.

