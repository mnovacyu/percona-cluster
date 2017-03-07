# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "mysql0" do |mysql0|
    mysql0.vm.box = "bento/centos-7.2"
    mysql0.vm.hostname = 'mysql0'
    mysql0.vm.network "private_network", ip: "192.168.101.101"
    mysql0.vm.synced_folder "shared/", "/root/shared"
    mysql0.vm.provision "shell", path: "cluster.sh"
  end

  config.vm.define "mysql1" do |mysql1|
    mysql1.vm.box = "bento/centos-7.2"
    mysql1.vm.hostname = 'mysql1'
    mysql1.vm.network "private_network", ip: "192.168.101.102"
    mysql1.vm.synced_folder "shared/", "/root/shared"
    mysql1.vm.provision "shell", path: "cluster.sh"
  end
end
