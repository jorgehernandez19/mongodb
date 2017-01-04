#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#package 'epel-release' do
#    action :install
#end
#
#package 'nginx' do
#    action :install
#end
#
#service 'nginx' do
#    action [ :enable, :start]
#end
#
#directory '/usr/share/nginx/www/' do
#    mode "0755"
#
if node['platform'] == 'centos'
 # do ubuntu things
 # :B
   yum_repository 'mongodb' do
      description "MongoDB repo ver 3.4"
      baseurl "https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.4/x86_64/"
      gpgkey "https://www.mongodb.org/static/pgp/server-3.4.asc"
      action :create
   end
end

package 'mongodb-org' do
    action :install
end

template '/etc/mongod.conf' do
  source 'mongod.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'mongod' do
    action [ :enable, :start]
end
