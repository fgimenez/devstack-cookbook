default['devstack_cookbook']['database_password'] =
  default['devstack_cookbook']['rabbit_password'] =
  default['devstack_cookbook']['service_password'] =
  default['devstack_cookbook']['admin_password'] = 'openstack'

default['devstack_cookbook']['src_path'] = '/opt/stack'
default['devstack_cookbook']['devstack_path'] = File.join(node['devstack_cookbook']['src_path'],
                                                          'devstack')
default['devstack_cookbook']['repository'] = 'https://git.openstack.org/openstack-dev/devstack'
