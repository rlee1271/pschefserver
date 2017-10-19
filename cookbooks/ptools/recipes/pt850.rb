#
# Cookbook:: ptools
# Recipe:: pt8.50
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'ptools::directoryStructure'

if !File.directory?("/apps/psoft/ptools/pt850")
   #Place tarball on node
   remote_file "/apps/psoft/ptools/pt850.tar" do
      source "http://pschefserver.timeinc.com:8080/files/pt850.tar"
      action :create
   end

   #extract node only if it has not been extracted already
   execute "pt850.tar" do
      cwd '/apps/psoft/ptools'
      command "tar -xvf /apps/psoft/ptools/pt850.tar;rm pt850.tar"
   end
end

template "/apps/psoft/ptools/pt850/psconfig.sh" do
   source 'psconfig850.sh.erb'
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
      :PS_HOME => node['pt850']['PS_HOME']
   })
end

