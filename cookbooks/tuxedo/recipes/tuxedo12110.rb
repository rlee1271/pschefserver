#
# Cookbook Name:: tuxedo 
# Recipe:: tuxedo 12.1.1.0
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#Create each directory
%w[ /apps/psoft /apps/psoft/tuxedo].each do |path| 
   directory path do
      owner 'psoft'
      group 'psoft'
#      mode '0755'
      action :create
   end
end

if !File.exists?("/apps/psoft/tuxedo/tuxedo12.1.1.0/tux.env")
   #Place tarball on node
   remote_file '/apps/psoft/tuxedo/tuxedo12.tar.gz' do
      source 'http://pschefserver.timeinc.com:8080/files/tuxedo12.tar.gz'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_tuxedo12.tar.gz' do
      cwd '/apps/psoft/tuxedo'
      command 'tar -xvf /apps/psoft/tuxedo/tuxedo12.tar.gz;rm tuxedo12.tar.gz' 
   end
end
