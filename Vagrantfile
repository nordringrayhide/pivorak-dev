# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      mkdir -p /root/.ssh
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
  end

  config.vm.box = "bento/ubuntu-16.04"
  config.ssh.forward_agent = true

  config.vm.define "app0" do |app0|
    app0.vm.network "private_network", ip: "192.168.2.10"

    app0.vm.hostname = "app0"
    app0.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.memory = 512
      v.cpus = 1
    end
  end
end
