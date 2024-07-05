# Ansible Practice Lab - Built using Fedora Containers

This project is meant to create Ansible containers to act as servers that will be customized. It currently utilizes Fedora 40 images that can be built from the Containers/Containerfile. There have been scripts already created to launch and setup the entire environment, and for convenience, container images have also been build and provided.

The container image created is possible to run SystemD services and will run on a specified container network. In order to fully work properly, the containers must be run in privileged mode so that all the network access is provided. The easiest method to use the practice Ansible containers is from a Linux system and using the **Ansible_Practice.sh* script.

This project does not install Ansible Content Navigator (**ansible-navigator**) or Ansible Core packages to the system and it is expected that is already completed on the system you are using for development. For simplicity, I have created a Fedora Remix that has all the Ansible development tools and container tools that will allow a full-blown lab environment to be created. The ISO can be downloaded from: https://drive.google.com/file/d/1D1apDwtcOEGIGDE9ZQYB8303nUvAdUxB/view?usp=drive_link. A website of instructions can be found: https://tmichett.github.io/ansible-practice/


The Fedora Remix already has the **Ansible Developer** tools installed which includes the **ansible-navigator** command from upstream. It is also possible to use this demonstration on a Red Hat Enterprise Linux (RHEL) system as long as Podman is installed and you have the access to the Ansible Automation Platform packages. This does not changes the servers (ServerA, ServerB, ServerC) as these images are built with a Fedora 40 base image. If you want to change the end-systems that are being configured, it will be necessary to update the Containerfile with an appropriate base image and rebuild the container image.

[!TIP]
Fedora Remix ISO: https://drive.google.com/file/d/1D1apDwtcOEGIGDE9ZQYB8303nUvAdUxB/view?usp=drive_link


## Preliminary Steps

The first thing to do is to create the directory for the repository and clone down the contents. After that has been completed, it is possible to install the *ansible-practice* system using scripts and leveraging pre-built containers or you can manually build your own container image using the provided scripts. Finally, there is a demonstration to do everything by hand and generate a SERVERA system.

1. Create a Github Repository Folder
````
mkdir ~/Github/ ; cd ~/Github/ 
````

2. Clone the repository
````
git clone https://github.com/tmichett/ansible-practice.git
````
3. Switch to the Correct Directory
````
cd ~/Github/ansible-practice/Containers
````

## Installing and Using the Ansible Practice Containers


### Using the Scripts to Setup and Run the Lab Machines (Manually Creating the Image)


1. Building the Container Image
````
sudo ./Ansible_Practice_Image_Create.sh
````

2. Running the Lab Environment
````
sudo ./Ansible_Practice_Setup.sh
````

3. Cleaning up the Lab Environment
````
sudo ./Ansible_Practice_Cleanup.sh
````

### Manually Building and Running the Lab Machines

These instructions allow for manually building and overriding the containerized instructions manually. It is possible at this stage to easiy change the Containerfile in order to have different base images for the test containers.

**Building the Container Image from Containerfile**

1. Build and Tag the Container Image
````
sudo podman build -t systemd-ansible-server .
````

2. Running a Container [^1]

````
sudo podman run --cap-add AUDIT_WRITE -P -d -p 2222:22 --network ansiblenet --name servera localhost/systemd-ansible-server:latest
````

````
sudo podman inspect -f '{{.NetworkSettings.Networks.ansiblenet.IPAddress}}' servera 
````


3. Cleaning Up
````
sudo podman rm -f servera
````



[^1]: It is important to add audit capabilities and run the container as **root** in privileged mode so you can access the container network. The port forwarding is performed in order to allow the custom container inventory file to have the **ansible-host** connection variable defined.