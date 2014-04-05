%w(git git-review emacs).each do |pkg|
  package pkg
end

execute 'clone devstack repo' do
  command "sudo rm -rf devstack && git clone https://github.com/openstack-dev/devstack.git && chown -R vagrant:vagrant ./devstack"
  cwd node['devstack_cookbook']['src_path']
end

template "#{node['devstack_cookbook']['devstack_path']}/local.conf" do
  source 'local.conf.erb'
  variables({database_password: node['devstack_cookbook']['database_password'],
             rabbit_password: node['devstack_cookbook']['rabbit_password'],
             service_token: node['devstack_cookbook']['service_token'],
             service_password: node['devstack_cookbook']['service_password'],
             admin_password: node['devstack_cookbook']['admin_password']})
  user 'vagrant'
end

