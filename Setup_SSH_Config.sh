#!/bin/bash
# Travis Michette <tmichett@redhat.com>

## Create SSH Config Drop-In Directory and Copy SSH Config File for Ansible
mkdir ~/.ssh/config.d
cp SSH_Config/SSH_Ansible.conf  ~/.ssh/config.d/SSH_Ansible.conf

## Insert Line about Drop-In Directory at the Beginning of the File
sed -i '1s/^/Include ~\/.ssh\/config.d\/*.conf\n/' ~/.ssh/config
