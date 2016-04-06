#!/bin/bash

set -ex

echo "======= Delete all linux headers and source"
dpkg --list | awk '{ print $2 }' | grep linux-headers | xargs apt-get -y purge
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v `uname -r` | xargs apt-get -y purge
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge
dpkg --list | awk '{ print $2 }' | grep -- '-dev$' | xargs apt-get -y purge

# delete compilers and other development tools
apt-get -y purge gcc dkms
apt-get -y --purge autoremove
apt-get -y autoclean

# dd if=/dev/zero of=/EMPTY bs=1M
# rm -f /EMPTY
