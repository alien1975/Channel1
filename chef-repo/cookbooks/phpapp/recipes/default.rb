#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_headers"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_filter"
include_recipe "apache2::mod_file_cache"
include_recipe "mysql::ruby"
include_recipe "php::module_curl"
include_recipe "php::module_apc"
include_recipe "php::module_gd"
include_recipe "php::module_memcache"
include_recipe "memcached"
include_recipe "java"
include_recipe "php::module_XSL"
include_recipe "php::module_imap"


apache_site "default" do
  enable false
end



mysql_database node['phpapp']['database'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    action :create
end 

mysql_database_user node['phpapp']['db_username'] do
   connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
   password node['phpapp']['db_password']
   database_name node['phpapp']['database']
   privileges [:select,:update,:insert,:create,:delete]
    action :grant
end    
 


 Data_integration_latest = Chef::Config[:file_cache_path] + "/pdi-ce-latest.tar.gz"

 remote_file Data_integration_latest do 
 source "http://sourceforge.net/projects/pentaho/files/Data%20Integration/4.4.0-stable/pdi-ce-4.4.0-stable.tar.gz"
 mode "0644"
 end

directory node["phpapp"]["path"] do
  owner "bharath"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar-pdi-ce" do
 cwd node['phpapp']['path']
 command "tar --strip-components 1 -xzf" + Data_integration_latest
 end


Kaltura_latest = Chef::Config[:file_cache_path] + "/kalturaCE_latest.tgz"

 remote_file Kaltura_latest do
 source "http://www.kaltura.org/releases/kalturaCE/18514"
 mode "0644"
 end

directory node['phpapp']['path1'] do
  owner "bharath"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar-kalturaCE" do
 cwd node['phpapp']['path1']
 command "tar --strip-components 1 -xzf" + Kaltura_latest
end 


template node['phpapp']['path1'] + '/user_input.ini' do
    source 'user_input.ini.rb'
    mode 0755
    owner 'bharath'
    group 'root'  
   end

execute "php install.php" do
 cwd node['phpapp']['path1']
 command "php install.php"
end

template node['phpapp']['path2'] + '/hosts' do
  source 'hosts.rb'
  mode 0755
  owner 'bharath'
  group 'root'
end

template node['phpapp']['path3'] + '/apache2.conf' do
  source 'apache2.conf.rb'
  mode 0755
  owner 'bharath'
  group 'root'
end  

wordpress_latest = Chef::Config[:file_cache_path] + "/wordpress-latest.tar.gz"

remote_file wordpress_latest do
  source "http://wordpress.org/latest.tar.gz"
  mode "0644"
end

directory node["phpapp"]["path4"] do
  owner "bharath"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar-wordpress" do
  cwd node['phpapp']['path4']
  command "tar --strip-components 1 -xzf " + wordpress_latest
  creates node['phpapp']['path4'] + "/wp-settings.php"
end

wp_secrets = Chef::Config[:file_cache_path] + '/wp-secrets.php'

remote_file wp_secrets do
  source 'https://api.wordpress.org/secret-key/1.1/salt/'
  action :create_if_missing
  mode 0644
end

salt_data = ''

ruby_block 'fetch-salt-data' do
  block do
    salt_data = File.read(wp_secrets)
  end
  action :create
end

template node['phpapp']['path'] + '/wp-config.php' do
  source 'wp-config.php.erb'
  mode 0755
  owner 'root'
  group 'root' 
  variables(
    :database        => node['phpapp']['database'],
    :user            => node['phpapp']['db_username'],
    :password        => node['phpapp']['db_password'],
    :wp_secrets      => salt_data)
end

web_app 'phpapp' do
  template 'site.conf.erb'
  docroot node['phpapp']['path4']
  server_name node['phpapp']['server_name']
end
