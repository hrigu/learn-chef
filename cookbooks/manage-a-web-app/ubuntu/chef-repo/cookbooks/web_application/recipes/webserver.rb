#
# Cookbook Name:: web_application
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# Install Apache and configure its service.
include_recipe 'apache2::default'

# Create and enable your custom site.
web_app node['web_application']['name'] do
  template "#{node['web_application']['config']}.erb"
end

# Create the document root.
directory node['apache']['docroot_dir'] do
  recursive true
end

# Write a default home page.
template "#{node['apache']['docroot_dir']}/index.php" do
  source 'index.php.erb'
  mode '0644'
  owner node['web_application']['user']
  group node['web_application']['group']
end

# Open port 80 to incoming traffic.
firewall_rule 'http' do
  port 80
  protocol :tcp
  action :allow
end

# Install the mod_php5 Apache module.
include_recipe 'apache2::mod_php5'

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'service[apache2]'
end
