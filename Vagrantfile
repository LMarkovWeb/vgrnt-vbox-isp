# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.box = "generic/centos8"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL
  
  # ispmanager
  config.vm.define "ispmngr" do |ispmngr|
    ispmngr.vm.hostname = 'isp.loc'
    ispmngr.vm.network "private_network", ip: "192.168.20.10"
    ispmngr.vm.provision "shell", path: "scripts/install_ispmngr.sh"
    ispmngr.vm.network "forwarded_port", id: "ispmngr", guest: 1500, host: 8888, guest_ip: "10.0.2.15", host_ip: "127.0.0.1", protocol: "tcp"
  end

  # # vmmanager
  # config.vm.define "vmmngr" do |vmmngr|
  #   vmmngr.vm.hostname = 'vm.loc'
  #   vmmngr.vm.network "private_network", ip: "192.168.20.11"
  # end

  # # billmanager
  # config.vm.define "billmngr" do |billmngr|
  #   billmngr.vm.hostname = 'bill.loc'
  #   billmngr.vm.network "private_network", ip: "192.168.20.12"
  # end
end