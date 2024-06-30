# Ansible Practice Lab - Built using Fedora Containers

**Building the Container Image from Containerfile**

Create a Github Repository Folder
````
mkdir ~/Github/ ; cd ~/Github/ 
````

Clone the repository
````
git clone https://github.com/tmichett/ansible-practice.git
````

Switch to the Correct Directory
````
cd ~/Github/ansible-practice/Containers
````

Build and Tag the Container Image
````
podman build -t systemd-ansible-server .
````

Running a Container

````
podman run -d -p 2222:22 --name servera localhost/systemd-ansible-server:latest
````

Cleaning Up
````
podman rm -f servera

````
