#!/bin/bash
# Travis Michette <tmichett@redhat.com>
## Needs to be run with SUDO

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Verifying Container Image Exists ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

sudo podman pull ghcr.io/tmichett/ansible-practice/systemd-ansible-server:latest

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Launching Servers now ....."
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""

## Create Podman Network

sudo podman network create ansiblenet

## ServerA Launching
sudo podman run --cap-add AUDIT_WRITE -P -d -p 2222:22 --network ansiblenet --name servera ghcr.io/tmichett/ansible-practice/systemd-ansible-server:latest

## ServerB Launching
sudo podman run --cap-add AUDIT_WRITE -P -d -p 2322:22 --network ansiblenet --name serverb ghcr.io/tmichett/ansible-practice/systemd-ansible-server:latest

## ServerC Launching
sudo podman run --cap-add AUDIT_WRITE -P -d -p 2422:22 --network ansiblenet --name serverc  ghcr.io/tmichett/ansible-practice/systemd-ansible-server:latest

printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Servers launched and ready to use!!!"
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""



printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
printf '\e[1;34m%-6s\e[m' "Server A IP Address: "
sudo podman inspect -f '{{.NetworkSettings.Networks.ansiblenet.IPAddress}}' servera
echo ""
printf '\e[1;34m%-6s\e[m' "Server B IP Address: "
sudo podman inspect -f '{{.NetworkSettings.Networks.ansiblenet.IPAddress}}' serverb
echo ""
printf '\e[1;34m%-6s\e[m' "Server C IP Address: "
sudo podman inspect -f '{{.NetworkSettings.Networks.ansiblenet.IPAddress}}' serverc
echo ""
printf '\e[1;34m%-6s\e[m' "================================================================"
echo ""
