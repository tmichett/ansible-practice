# Ansible Practice Lab - Built using Fedora Containers

The **ansible-navigator.yml** file provided here assumes that you have a subscription to Red Hat and can download supported Ansible Execution Environment Images. The playbooks here have been tested with supported images on the containers and can and do work in the containerized Ansible practice lab. You must modify the **ansible-navigator.yml** to another execution environment if you are unable to download Red Hat supported EEIs.

## Obtaining the EE

1. Login to the container registry
````
podman login registry.redhat.io
````

2. Pull down container image (EEI)
````
podman pull registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel8
````

## Testing Ansible Navigator

1. Test Basic Connectivity
````
[travis@fedora Ansible_Test]$ ansible-navigator run Connectivity_Test.yml 
````

2. Test Connectivity with Become
````
ansible-navigator run Connectivity_Test_Become.yml 
````