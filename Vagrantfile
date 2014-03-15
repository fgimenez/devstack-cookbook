# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  
  config.vm.box = "saucy-ubuntu"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/saucy/20140312/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  
  config.vm.network :private_network, ip: "33.33.33.11"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096", '--cpus', '4']
  end
  
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      run_list: ['recipe[devstack_cookbook::default]']
    }
  end

end
