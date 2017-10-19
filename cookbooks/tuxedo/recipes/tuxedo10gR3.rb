#
# Cookbook Name:: tuxedo 
# Recipe:: directoryStructure
#
# Copyright 2017, Business Systems
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tuxedo::directoryStructure'

if !File.exists?("/apps/psoft/tuxedo/tuxedo10gR3/tux.env")
   #Place tarball on node
   remote_file '/apps/psoft/tuxedo/tuxedo10gR3.tar' do
      source 'http://pschefserver.timeinc.com:8080/files/tuxedo10gR3.tar'
      action :create
   end

   #extract node only if it has not been extracted already
   execute 'extract_tuxedo10gR3.tar' do
      cwd '/apps/psoft/tuxedo'
      command 'tar -xvf /apps/psoft/tuxedo/tuxedo10gR3.tar;rm tuxedo10gR3.tar' 
   end
end
