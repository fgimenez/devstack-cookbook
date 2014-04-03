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
vagrant sh -c "git config --global user.email '$GIT_EMAIL'"
vagrant sh -c "git config --global user.name '$GIT_NAME'"

vagrant sh -c 'mkdir -p ~/.ssh'
scp -i ~/.vagrant.d/insecure_private_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/.ssh/id_rsa* vagrant@devstack.local:/home/vagrant/.ssh


