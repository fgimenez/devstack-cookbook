This cookbook sets up a devstack (http://devstack.org/) vm based on Vagrant (1.4+) and VirtualBox. Just:

    ./bootstrap.sh

The process sets the machine name to devstack.local and the ip to 33.33.33.11 by default. 

In order to make reviews easier it also sets up git's user.name and user.email to the values of the host machine, and copies the ssh keys to the guest (perhaps this behaviour is not what you need, please take this into account).
