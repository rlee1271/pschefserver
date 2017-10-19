# Cookbook Name:: weblogic
# Recipe:: weblogic 12.1.2
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'weblogic::directoryStructure'
include_recipe 'weblogic::jdk1.7'

if !File.directory?("/apps/psoft/weblogic/weblogic1036")
   #Place tarball on node
   remote_file '/apps/psoft/weblogic/weblogic1036.tar' do
      source 'http://pschefserver.timeinc.com:8080/files/weblogic1036.tar'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_weblogic1036.tar' do
      cwd '/apps/psoft/weblogic'
      command 'tar -xvf /apps/psoft/weblogic/weblogic1036.tar;rm weblogic1036.tar'
      notifies :run, 'execute[edit-files-with-path]', :delayed
#      notifies :run, 'execute[edit-files-with-path-java]', :delayed
   end

   execute 'edit-files-with-path' do
      command 'find /apps/psoft/weblogic/weblogic1036 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1036" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1036/\/apps\/psoft\/weblogic\/weblogic1036/g" {} \;'
      action :nothing
   end

   execute 'edit-files-with-path-java' do
      command 'find /apps/psoft/weblogic/weblogic1036 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1036/jdk1.7.0_09" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1036\/jdk1.7.0_09/\/apps\/psoft\/java\/jdk1.7.0_80/g" {} \;'
      action :nothing
   end
end


