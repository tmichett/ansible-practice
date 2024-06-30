# Ansible Practice Lab - Built using Fedora Containers

## Using the Scripts to Setup and Run the Lab Machines

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

Building the Container Image
````
./Ansible_Practice_Image_Create.sh
````

Running the Lab Environment
````
./Ansible_Practice_Setup.sh
````

Cleaning up the Lab Environment
````
./Ansible_Practice_Cleanup.sh
````

## Manually Running the Lab Machines

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
