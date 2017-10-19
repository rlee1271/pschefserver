# Cookbook Name:: peoplesoft
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if !File.directory?("/apps/psoft/java/jdk1.7.0_80")
   #Place Java tarball file in Weblogic directory
   remote_file '/apps/psoft/java/jdk-7u80-linux-x64.tar.gz' do
      source 'http://pschefserver.timeinc.com:8080/files/jdk-7u80-linux-x64.tar.gz'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_jdk-7u80-linux-x64.tar.gz' do
      cwd '/apps/psoft/java'
      command 'tar -xvf /apps/psoft/java/jdk-7u80-linux-x64.tar.gz;rm jdk-7u80-linux-x64.tar.gz;chown -R psoft:psoft /apps/psoft/java/jdk1.7.0_80'
   end
end
