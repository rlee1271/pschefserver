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

