# Cookbook Name:: peoplesoft
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if !File.exists?("/apps/psoft/weblogic/weblogic1212/jdk1.7.0_80/README.html")
   #Place Java tarball file in Weblogic directory
   remote_file '/apps/psoft/weblogic/weblogic1212/jdk-7u80-linux-x64.tar.gz' do
      source 'http://10.176.86.71/files/jdk-7u80-linux-x64.tar.gz'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_jdk-7u80-linux-x64.tar.gz' do
      cwd '/apps/psoft/weblogic/weblogic1212'
      command 'tar -xvf /apps/psoft/weblogic/weblogic1212/jdk-7u80-linux-x64.tar.gz;rm jdk-7u80-linux-x64.tar.gz'
   end
end

template '/apps/psoft/weblogic/weblogic1212/oracle_common/common/bin/commEnv.sh' do
   source 'commEnv.erb'
   variables({
     :JAVA_HOME => node['java']['JAVA_HOME']
   })
end

