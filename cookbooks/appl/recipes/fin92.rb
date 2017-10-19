#
# Cookbook:: appl
# Recipe:: fin9.2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w[/apps/psoft/appl].each do |path|
   directory path do
      owner 'psoft'
      group 'psoft'
      mode '0755'
      action :create
   end
end

#extract node only if it has not been extracted already
if !File.directory?("/apps/psoft/appl/fin92-854")
   #Place tarball on node
   remote_file "/apps/psoft/appl/fin92-854.tar.gz" do
      source "http://pschefserver.timeinc.com:8080/files/fin92-854.tar.gz"
      action :create
   end

   execute "fin92-854.tar.gz" do
      cwd '/apps/psoft/appl'
      command "tar -xvf /apps/psoft/appl/fin92-854.tar.gz;rm fin92-854.tar.gz"
   end
end

template "/home/psoft/setfin92-854" do
   source "setfin92-854.erb"
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
     :ORACLE_SID      => node['setfin92-854']['ORACLE_SID'],
     :ORACLE_HOME     => node['setfin92-854']['ORACLE_HOME'],
     :ORACLE_BASE     => node['GlobalEnv']['ORACLE_BASE'],
     :COBDIR          => node['setfin92-854']['COBDIR'],
     :TUXDIR          => node['setfin92-854']['TUXDIR'],
     :PATH            => node['GlobalEnv']['PATH'],
     :LD_LIBRARY_PATH => node['GlobalEnv']['LD_LIBRARY_PATH'],
     :PS_APP_HOME     => node['setfin92-854']['PS_APP_HOME']
   })
end

