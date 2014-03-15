default['devstack_cookbook']['database_password'] =
  default['devstack_cookbook']['rabbit_password'] =
  default['devstack_cookbook']['service_token'] =
  default['devstack_cookbook']['service_password'] =
  default['devstack_cookbook']['admin_password'] = 'openstack'

default['devstack_cookbook']['src_path'] = '~'
default['devstack_cookbook']['devstack_path'] = File.join(node['devstack_cookbook']['src_path'],
                                                          'devstack')
