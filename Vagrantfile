# -*- mode: ruby -*-
# vi: set ft=ruby :

##
#
#
Vagrant.configure(2) do |config|
  config.vm.box = "activatedgeek/mesos"
  # config.vm.box_check_update = false

  config.vm.network "private_network", ip: "172.90.90.10"

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = "1"
  end
end
