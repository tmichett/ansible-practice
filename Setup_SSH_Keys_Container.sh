#!/bin/bash
# Travis Michette <tmichett@redhat.com>

## Create SSH Config Drop-In Directory and Copy SSH Config File for Ansible
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Copying SSH Keys for the ansible-user now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

ssh-copy-id -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=accept-new ansible-user@servera 
ssh-copy-id -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=accept-new ansible-user@serverb 
ssh-copy-id -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=accept-new ansible-user@serverc 

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "SSH Keys have been successfully configured ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
