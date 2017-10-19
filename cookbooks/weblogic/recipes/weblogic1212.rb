# Cookbook Name:: weblogic
# Recipe:: weblogic 12.1.2
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'weblogic::directoryStructure'
include_recipe 'weblogic::jdk1.7'

if !File.directory?("/apps/psoft/weblogic/weblogic1212")
   #Place tarball on node
   remote_file '/apps/psoft/weblogic/weblogic1212.tar.gz' do
      source 'http://pschefserver.timeinc.com:8080/files/weblogic1212.tar.gz'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_weblogic1212.tar.gz' do
      cwd '/apps/psoft/weblogic'
      command 'tar -xvf /apps/psoft/weblogic/weblogic1212.tar.gz;rm weblogic1212.tar.gz'
      notifies :run, 'execute[edit-files-with-path]', :delayed
      notifies :run, 'execute[edit-files-with-path-java]', :delayed
   end

   execute 'edit-files-with-path' do
      command 'find /apps/psoft/weblogic/weblogic1212 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1212" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1212/\/apps\/psoft\/weblogic\/weblogic1212/g" {} \;'
      action :nothing
   end

   execute 'edit-files-with-path-java' do
      command 'find /apps/psoft/weblogic/weblogic1212 -name "*.*" -type f -exec grep -Hl "/apps/psoft/temp/wl-install/jdk1.7.0_80" {} \; -exec sed -i "s/\/apps\/psoft\/temp\/wl-install\/jdk1.7.0_80/\/apps\/psoft\/java\/jdk1.7.0_80/g" {} \;'      
      action :nothing
   end




end


