#!/bin/bash
# Travis Michette <tmichett@redhat.com>
## Needs to be run with SUDO

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Updating /etc/hosts now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

ansible-playbook Create_Hosts_File.yml

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "System is Ready to User"
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

