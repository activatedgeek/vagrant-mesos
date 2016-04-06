#!/bin/bash

set -ex

echo "======= Updating and Upgrading packages"
apt-get -y update
apt-get -y upgrade

echo "======= Install base packages"
apt-get -y install \
  linux-headers-$(uname -r) \
  virtualbox-guest-utils \
  git \
  software-properties-common

echo "======= Enable passwordless sudo"
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

echo "======= Setup default insecure vagrant ssh key"
mkdir -pm 700 /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
echo "UseDNS no" >> /etc/ssh/sshd_config
