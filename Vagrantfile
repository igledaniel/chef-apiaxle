# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.5.0"

Vagrant.configure('2') do |config|
  config.omnibus.chef_version = '11.12.8'
  config.vm.hostname          = 'apiaxle'
  config.vm.box               = 'ubuntu-14.04-opscode'
  config.berkshelf.enabled    = true
  config.vm.box_url           = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

  config.vm.network :private_network, ip: '192.168.10.10'
  config.vm.network :forwarded_port, host: 8000, guest: 3000

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
      'recipe[apiaxle::default]'
    ]
  end
end
