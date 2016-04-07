#!/bin/bash

# set -ex

# install ansible
apt-add-repository -y ppa:ansible/ansible
apt-get -y update
apt-get install -y ansible

cd /tmp
git clone https://github.com/activatedgeek/orchestrator.git

## setup the hosts file
read -r -d '' ANSIBLE_HOSTS << EOH
vagrant-mesos zookeeper_id=1

[mesos-master]
vagrant-mesos

[mesos-slave]
vagrant-mesos

EOH
echo "$ANSIBLE_HOSTS" > ./orchestrator/ANSIBLE_HOSTS

## setup a new playbook file
read -r -d '' PLAYBOOK << EOP
---
- hosts: all
  roles:
    - { role: 'mesos', mode: 'master' }
    - { role: 'mesos', mode: 'slave' }
    - { role: 'consul', mode: 'server' }
EOP
echo "$PLAYBOOK" > ./orchestrator/playbook/vagrant-mesos.yml

ansible-playbook -i ./orchestrator/ANSIBLE_HOSTS \
  -c local \
  -e "zookeeper_id=1" \
  ./orchestrator/playbook/vagrant-mesos.yml

rm -r /tmp/orchestrator
