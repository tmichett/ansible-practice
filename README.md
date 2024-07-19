# Ansible Practice Lab - Built using Fedora Containers

This project is meant to create Ansible containers to act as servers that will be customized. It currently utilizes Fedora 40 images that can be built from the Containers/Containerfile. There have been scripts already created to launch and setup the entire environment, and for convenience, container images have also been build and provided.

The container image created is possible to run SystemD services and will run on a specified container network. In order to fully work properly, the containers must be run in privileged mode so that all the network access is provided. The easiest method to use the practice Ansible containers is from a Linux system and using the **Ansible_Practice.sh* script.

This project does not install Ansible Content Navigator (**ansible-navigator**) or Ansible Core packages to the system and it is expected that is already completed on the system you are using for development. For simplicity, I have created a Fedora Remix that has all the Ansible development tools and container tools that will allow a full-blown lab environment to be created. The ISO can be downloaded from: https://drive.google.com/file/d/1D1apDwtcOEGIGDE9ZQYB8303nUvAdUxB/view?usp=drive_link. A website of instructions can be found: [https://tmichett.github.io/ansible-practice/](https://tmichett.github.io/ansible-practice/)


The Fedora Remix already has the **Ansible Developer** tools installed which includes the **ansible-navigator** command from upstream. It is also possible to use this demonstration on a Red Hat Enterprise Linux (RHEL) system as long as Podman is installed and you have the access to the Ansible Automation Platform packages. This does not changes the servers (ServerA, ServerB, ServerC) as these images are built with a Fedora 40 base image. If you want to change the end-systems that are being configured, it will be necessary to update the Containerfile with an appropriate base image and rebuild the container image.

> [!TIP]
> Fedora Remix ISO: https://drive.google.com/file/d/1D1apDwtcOEGIGDE9ZQYB8303nUvAdUxB/view?usp=drive_link


The containers are Fedora 40 images with SystemD and a user called **ansible-user** already created with a password of **password**. This **ansible-user** is already in a SUDOERS file that has full SUDO acccess without a password. The only thing needing done is to transfer SSH keys to the containers. There is a script for that purpose **Setup_SSH_Keys_Container.sh**.

Additionally, because the containers change, any SSH should be done with options to allow any of the keys and not write keys to KNOWN_HOSTS. I've created an **ansible.cfg** file which uses **-o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=accept-new** SSH options to eliminate any hassle with the SSH keys. There is also a playbook to create an SSH Config file which should have some SSH options and allow accessing containers via port-forward with SSH.


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

> [!IMPORTANT]
> The **Setup_SSH_Config.sh** script will create an SSH config file in the users directory. This file is created to allow users to easily SSH to systems by the name and port-forwarding that has been setup. ServerA => 2222, ServerB => 2322, ServerC => 2422. This greatly simplifies the connection to the systems as well as the inventory file. An alternate inventory file has been created in the event that you choose not to change SSH client configurations.

4. Creating a custom SSH Config File **(Not needed if you setup /etc/hosts)**
````
./Setup_SSH_Config.sh
````



## Installing and Using the Ansible Practice Containers

There are a number of ways to use this repository. They are documented below. The easiest way to use this project is following the **Fully-Automated Installer instructions**. There are also some helper scripts created to allow an SSH Client configuration file to be created as well as scripts to obtain the IP addresses of each of the "server" containers. Finally, to make things super easy, there are playbooks that have been created to update the **/etc/hosts** file allowing access to the running containers by the short hostname (servera, serverb, or serverc). The two playbooks can both add the entries and clean entries up in the **/etc/hosts** file.


### Fully-Automated Installer

It is possible to fully install and automate the process of setting up Server container images for practicing running and developing Ansible playbooks. The following steps allow complete automation of these items. These steps assume that you have already cloned the repository and completed the initial setup.

1. Install the Scripts and Resource files to /opt/ansible-practice
```` 
./Install_Ansible_Practice.sh
````

2. Launch the **Ansible_Practice.sh** script
````
/opt/ansible-practice/Ansible_Practice.sh
````
> [!NOTE]
> This launches three (3) containers ServerA, ServerB, ServerC and outputs the IP Addresses of each. In order to reference the systems by name, you can update /etc/hosts with the custom entries and you can also leverage the **Setup_SSH_Config.sh** script to create a localized SSH client configuration file.

3. Setup the **/etc/hosts** file for playbooks
````
/opt/ansible-practice/Setup_ETC_Hosts.sh
````

4. Setup the SSH Keys on the Containers
````
/opt/ansible-practice/Setup_SSH_Keys_Container.sh
````

> [!TIP]
> After disributing the SSH keys to the container, it is suggested to try the **Ansible_Test** folder playbooks to test connectivity as the **ansible-user** for SSH access via keys as well as testing for SUDO without a password. The **Connectivity_Test.yml** and **Connectivity_Test_Become.yml** can test all three (3) Server containers for access.


**Cleaning up the Lab Environment**

After you have completed with the lab environment, it is important to remove **/etc/hosts** entries and ensure the containers are stopped and the Podman **ansiblenetwork** has been removed and cleaned up. The **/etc/hosts** entries must be removed prior to cleaning up the containers.

1. Cleanup of **/etc/hosts** needs completed before cleaning up containers
````
/opt/ansible-practice/Cleanup_ETC_Hosts.sh
````


2. Cleanup running containers and Ansible container network
```` 
/opt/ansible-practice/Ansible_Practice_Cleanup.sh
```` 





### Using the Scripts to Setup and Run the Lab Machines (Manually Creating the Image)

It is possible to run scripts individually. This is done if you want to build the container image from scratch and possibly if you want to modify or change the container image. The scripts can be executed individually from the Github repository, or they can be exectuted at any time if you completed the **Install_Ansible_Practice.sh** script from the **/opt/ansible-practice** directory.

The instructions assume you are in either the **~/Github/ansible-practice** directory or **/opt/ansible-practice** directory.

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

These instructions allow for manually building and overriding the containerized instructions manually. It is possible at this stage to easiy change the Containerfile in order to have different base images for the test containers. You must be in the **~/Github/ansible-practice** directory or **/opt/ansible-practice** directory.

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
