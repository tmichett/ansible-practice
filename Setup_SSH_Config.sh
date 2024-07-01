#!/bin/bash
# Travis Michette <tmichett@redhat.com>

## Create SSH Config Drop-In Directory and Copy SSH Config File for Ansible
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Creating SSH Client Configuration Files/Directories now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

mkdir ~/.ssh/config.d
cp SSH_Config/SSH_Ansible.conf  ~/.ssh/config.d/SSH_Ansible.conf

## Insert Line about Drop-In Directory at the Beginning of the File
sed -i '1s/^/Include ~\/.ssh\/config.d\/*.conf\n/' ~/.ssh/config

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "SSH Clients have been successfully configured ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
