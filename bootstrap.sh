#!/bin/sh
bundle

rm -rf berks-cookbooks
bundle exec berks vendor

vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-shell-commander

vagrant hostmanager

vagrant destroy -f
vagrant up --provision

vagrant sh -c 'cd ~/devstack && ./stack.sh'
vagrant sh -c "git config --global user.email '$GIT_EMAIL'"
vagrant sh -c "git config --global user.name '$GIT_NAME'"
vagrant sh -c 'rm -rf ~/.emacs.d && git clone https://github.com/fgimenez/.emacs.d.git ~/.emacs.d'

vagrant sh -c 'mkdir -p ~/.ssh'
scp -i ~/.vagrant.d/insecure_private_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/.ssh/id_rsa* vagrant@devstack.local:/home/vagrant/.ssh


