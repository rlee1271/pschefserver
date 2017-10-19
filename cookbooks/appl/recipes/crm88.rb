#
# Cookbook:: appl
# Recipe:: crm8.8
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w[/apps/psoft/appl].each do |path|
   directory path do
      owner 'psoft'
      group 'psoft'
      action :create
   end
end

#extract node only if it has not been extracted already
if !File.directory?("/apps/psoft/appl/crm88-850")
   #Place tarball on node
   remote_file "/apps/psoft/appl/crm88-850.tar" do
      source "http://pschefserver.timeinc.com:8080/files/crm88-850.tar"
      action :create
   end

   execute "crm88-850.tar" do
      cwd '/apps/psoft/appl'
      command "tar -xvf /apps/psoft/appl/crm88-850.tar;rm crm88-850.tar"
   end
end

template "/home/psoft/setcrm88-850" do
   source "setcrm88-850.erb"
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
     :ORACLE_SID      => node['setcrm88-850']['ORACLE_SID'],
     :ORACLE_HOME     => node['setcrm88-850']['ORACLE_HOME'],
     :ORACLE_BASE     => node['GlobalEnv']['ORACLE_BASE'],
     :COBDIR          => node['setcrm88-850']['COBDIR'],
     :TUXDIR          => node['setcrm88-850']['TUXDIR'],
     :PATH            => node['GlobalEnv']['PATH'],
     :LD_LIBRARY_PATH => node['GlobalEnv']['LD_LIBRARY_PATH'],
     :PS_APP_HOME     => node['setcrm88-850']['PS_APP_HOME']
   })
end

