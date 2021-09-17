# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "peru/ubuntu-20.04-desktop-amd64"
  config.vm.network "private_network", ip: "192.168.20.10"
  config.vm.hostname = "isp.example.com"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu20-server-isp_manager"
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
   end
  
  config.vm.define "ispmanager" do |t|
  end

  $script = <<-SCRIPT
      echo 'Install ISP Manager...'
      wget -P /tmp/ispmanager http://download.ispsystem.com/install.sh
      sudo systemctl disable apparmor
    SCRIPT
  config.vm.provision "shell",
    inline: $script
end