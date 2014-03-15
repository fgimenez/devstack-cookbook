#!/bin/sh
bundle

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

vagrant destroy
vagrant up
