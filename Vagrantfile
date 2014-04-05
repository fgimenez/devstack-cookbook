# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.box = "precise-ubuntu"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  
  config.vm.network :private_network, ip: "33.33.33.11"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "6020", '--cpus', '4']
  end

  config.vm.hostname = 'devstack.local'
  
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      run_list: ['recipe[devstack_cookbook::default]']
    }
  end

  config.sh.after_share_folders = 'cd ~/devstack && sudo losetup -f /opt/stack/data/stack-volumes-backing-file && ./rejoin-stack.sh'
end
