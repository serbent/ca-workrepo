# 19. Ansible intro

## Excercise 01
1. Create a playbook to install and start nginx
2. Run the playbook twice. 
3. Login to the machine and stop the nginx service. 
4. Run the playbook. 
5. Take note of the results.

## Excercise 02 
1. Use provided ansible-lab-docker or create your own VM of different linux flavors.
2. Write a playbook to install nginx on different linux containers. 
* use container groups 
* use 
```
when: ansible_facts['os_family'] 
```

## Excercise 03
1. Delete `nginx` and install `apache` on previously used machines.
