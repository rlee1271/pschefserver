#
# Cookbook Name:: tuxedo
# Recipe:: tuxedo10gR3
#
# Copyright 2017, Business Systems
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tuxedo::directoryStructure'

unless Dir.exist?('/apps/psoft/tuxedo/tuxedo10gR3')
  # Place tarball on node
  remote_file '/apps/psoft/tuxedo/tuxedo10gR3.tar' do
    owner 'psoft'
    group 'psoft'
    source 'http://pschefserver.timeinc.com:8080/files/tuxedo10gR3.tar'
    action :create
  end

  # extract node only if it has not been extracted already
  execute 'extract_tuxedo10gR3.tar' do
    user 'psoft'
    group 'psoft'
    cwd '/apps/psoft/tuxedo'
    command 'tar -xvf /apps/psoft/tuxedo/tuxedo10gR3.tar;rm tuxedo10gR3.tar'
  end
end
