#!/bin/bash
# Travis Michette <tmichett@redhat.com>
## Needs to be run with SUDO


printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Removing Servers now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
## ServerA Removal
sudo podman rm -f servera

## ServerB Removal
sudo podman rm -f serverb

## ServerC Launching
sudo podman rm -f serverc


## Podman Network Removal
sudo podman network rm ansiblenet

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Servers cleaned up and removed!!!"
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""




