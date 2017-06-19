# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest

  config.ssh.insert_key = false

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.box = 'ceph/ubuntu-xenial'

  config.vm.network :private_network, ip: '33.33.33.11'

  config.vm.provider :virtualbox do |v|
    v.memory = 8192
    v.cpus = 4
  end

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 8192
    libvirt.nested = true
    libvirt.machine_virtual_size = 80
    libvirt.cpus = 4
  end

  config.vm.hostname = 'devstack.local'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'berks-cookbooks'
    chef.json = {
      run_list: ['recipe[devstack_cookbook::default]']
    }
  end
end
