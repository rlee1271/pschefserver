#
# Cookbook:: pt850
# Recipe:: peopleToolsSetup
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

=begin
template "/apps/psoft/ptools/pt854/psconfig.sh" do
   source 'psconfig.sh.erb'
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
      :PS_HOME => node['pt854']['PS_HOME']
   })
end
=end

#=begin
template "/home/psoft/setcrm88-850" do
   source "setcrm88-850.erb"
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
     :ORACLE_SID      => node['GlobalEnv']['ORACLE_SID'],
     :ORACLE_HOME     => node['setcrm88-850']['ORACLE_HOME'],
     :ORACLE_BASE     => node['GlobalEnv']['ORACLE_BASE'],
     :COBDIR          => node['setcrm88-850']['COBDIR'],
     :TUXDIR 	      => node['setcrm88-850']['TUXDIR'],
     :PATH            => node['GlobalEnv']['PATH'],
     :LD_LIBRARY_PATH => node['GlobalEnv']['LD_LIBRARY_PATH']
   })
end
#=end
