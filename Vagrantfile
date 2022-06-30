# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/debian-11"
  config.vm.network "public_network"
  config.vm.hostname = "wordpress.local"
  
  config.vm.provider "vmware-desktop" do |vb|
    vb.gui = true
    vb.cpus = 1
    vb.memory = "512"

  end

  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|    
    ansible.host_key_checking = false
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
    #ansible.galaxy_role_path = "roles/"
  end

end