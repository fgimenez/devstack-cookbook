#!/bin/sh
bundle

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hostmanager

vagrant hostmanager

vagrant destroy
vagrant up
