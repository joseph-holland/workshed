# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "workshed" do |workshed|
  end

  config.vm.hostname = "workshed"

  config.vm.box = "bento/centos-7.3"

  config.vm.provider "virtualbox" do |vb|
     vb.name = "workshed"
     vb.cpus = "2"
     vb.memory = "1024"
  end

  config.vm.provision "file", source: "provision/bin", destination: "~"
  config.vm.provision "file", source: "provision/etc", destination: "~"
  config.vm.provision "file", source: "provision/.aws", destination: "~"
  config.vm.provision "file", source: "provision/.axe", destination: "~"

  config.vm.provision "shell",
    privileged: false,
    path: "provision/bootstrap.sh"
end
