#!/bin/bash
# Travis Michette <tmichett@redhat.com>

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Launching Servers now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

## ServerA Launching
podman run -d -p 2222:22 --name servera localhost/systemd-ansible-server:latest

## ServerB Launching
podman run -d -p 2322:22 --name serverb localhost/systemd-ansible-server:latest

## ServerC Launching
podman run -d -p 2422:22 --name serverc localhost/systemd-ansible-server:latest

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Servers launched and ready to use!!!"
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""




