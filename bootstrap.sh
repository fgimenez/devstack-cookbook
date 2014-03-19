#!/bin/sh
bundle

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-shell-commander

vagrant hostmanager

vagrant destroy
vagrant up --provision

vagrant sh -c 'cd ~/devstack && ./stack.sh'


