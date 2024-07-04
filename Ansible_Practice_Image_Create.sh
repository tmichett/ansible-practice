#!/bin/bash
# Travis Michette <tmichett@redhat.com>
## Needs to be run with SUDO

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Building the Container Image ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

cd Containers
podman build -t systemd-ansible-server .


printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Container Image Build Completed"
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""





