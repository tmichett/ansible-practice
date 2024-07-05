#!/bin/bash
# Travis Michette <tmichett@redhat.com>
## Needs to be run with SUDO

podman inspect -f '{{.NetworkSettings.Networks.ansiblenet.IPAddress}}' servera