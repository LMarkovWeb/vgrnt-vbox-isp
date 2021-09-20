# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL
  # @todo /etc/ssh/sshd_config PasswordAuthentication yes
  
  # ispmanager
  config.vm.define "ispmngr" do |ispmngr|
    ispmngr.vm.hostname = 'isp.loc'
    ispmngr.vm.network "private_network", ip: "192.168.20.10"

    # $script = <<-SCRIPT
    #     echo 'Install ISP Manager...'
    #     wget -P /tmp/ispmanager http://download.ispsystem.com/install.sh
    #   SCRIPT
    # ispmngr.vm.provision "shell",
    # inline: $script
  end
  # vmmanager
  config.vm.define "vmmngr" do |vmmngr|
    vmmngr.vm.hostname = 'vm.loc'
    vmmngr.vm.network "private_network", ip: "192.168.20.11"
  end
  # billmanager
  config.vm.define "billmngr" do |billmngr|
    billmngr.vm.hostname = 'bill.loc'
    billmngr.vm.network "private_network", ip: "192.168.20.12"
  end
end