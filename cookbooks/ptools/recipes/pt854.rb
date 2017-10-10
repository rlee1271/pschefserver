#
# Cookbook:: pt854
# Recipe:: peopleToolsSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w[ /apps/psoft /apps/psoft/ptools].each do |path|
   directory path do
      owner 'psoft'
      group 'psoft'
      mode '0755'
      action :create
   end
end

if !File.exists?("/apps/psoft/ptools/pt854/readme.txt")
   #Place tarball on node
   remote_file "/apps/psoft/ptools/pt854.tar.gz" do
      source "http://pschefserver.timeinc.com:8080/files/pt854.tar.gz"
      action :create
   end

   #extract node only if it has not been extracted already
   execute "pt854.tar.gz" do
      cwd '/apps/psoft/ptools'
      command "tar -xvf /apps/psoft/ptools/pt854.tar.gz;rm pt854.tar.gz"
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
template "/apps/psoft/setfin92-854" do
   source "setfin92-854.erb"
   owner 'psoft'
   group 'psoft'
   mode '0755'
   variables({
     :ORACLE_SID      => node['setfin92-854']['ORACLE_SID'],
     :ORACLE_HOME     => node['setfin92-854']['ORACLE_HOME'],
     :ORACLE_BASE     => node['setfin92-854']['ORACLE_BASE'],
     :COBDIR          => node['setfin92-854']['COBDIR'],
     :TUXDIR 	      => node['setfin92-854']['TUXDIR'],
     :PATH            => node['setfin92-854']['PATH'],
     :LD_LIBRARY_PATH => node['setfin92-854']['LD_LIBRARY_PATH'],
     :PS_APP_HOME     => node['setfin92-854']['PS_APP_HOME']
   })
end
#=end
