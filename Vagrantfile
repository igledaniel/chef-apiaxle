# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "apiaxle-berkshelf"
  config.omnibus.chef_version = :latest
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, host: 8000, guest: 3000
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
        "recipe[apiaxle::default]"
    ]
  end
end
