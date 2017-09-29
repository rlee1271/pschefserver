# Cookbook Name:: peoplesoft
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w[ /apps/psoft /apps/psoft/weblogic].each do |path|
   directory path do
      owner 'psoft'
      group 'psoft'
      mode '0755'
      action :create
   end
end

if !File.exists?("/apps/psoft/weblogic/weblogic1212/oraInst.loc")
   #Place tarball on node
   remote_file '/apps/psoft/weblogic/weblogic1212.tar.gz' do
      source 'http://pschefserver.timeinc.com:8080/files/weblogic1212.tar.gz'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_weblogic1212.tar.gz' do
      cwd '/apps/psoft/weblogic'
      command 'tar -xvf /apps/psoft/weblogic/weblogic1212.tar.gz;rm weblogic1212.tar.gz'
   end
end

#include_recipe 'weblogic::jdkConfiguration'
