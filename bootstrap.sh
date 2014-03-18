#!/bin/sh
bundle

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-shell-commander

vagrant hostmanager

#git clone git@github.com:openstack/horizon.git src/horizon

vagrant destroy
vagrant up --provision

vagrant sh -c 'cd ~/devstack && ./stack.sh'
vagrant sh -c 'cd /opt/stack/horizon && ./run_tests.sh --runserver -y'

