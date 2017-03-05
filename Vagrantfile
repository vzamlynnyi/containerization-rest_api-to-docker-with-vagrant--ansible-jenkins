# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "192.168.33.39"
  config.vm.hostname = "jenkins"

  config.vm.provider :virtualbox do |v|
    v.name = "jenkins"
    v.memory = 768
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Enable provisioning with Ansible.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/main.yml"
    #ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
  end

 # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
#   config.vm.provision "shell", inline: <<-SHELL
#     apt-get update
#     apt-get install -y mc
  #   apt-get install -y apache2
#   SHELL
   config.vm.provision "shell", path: "provisioning/jenkins_build.sh"
end
