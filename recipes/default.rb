include_recipe 'apt'

%w(git git-review emacs).each do |pkg|
  package pkg
end

directory node['devstack_cookbook']['src_path'] do
  user 'vagrant'
  group 'vagrant'
  recursive true
end

git node['devstack_cookbook']['devstack_path'] do
  repository node['devstack_cookbook']['repository']
  action :checkout
  user 'vagrant'
  group 'vagrant'
end

template File.join(node['devstack_cookbook']['devstack_path'], 'local.conf') do
  source 'local.conf.erb'
  variables({database_password: node['devstack_cookbook']['database_password'],
             rabbit_password: node['devstack_cookbook']['rabbit_password'],
             service_password: node['devstack_cookbook']['service_password'],
             admin_password: node['devstack_cookbook']['admin_password']})
  user 'vagrant'
end
