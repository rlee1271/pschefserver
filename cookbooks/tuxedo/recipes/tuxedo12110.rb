#
# Cookbook Name:: tuxedo
# Recipe:: tuxedo 12.1.1.0
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tuxedo::directoryStructure'

unless Dir.exist?('/apps/psoft/tuxedo/tuxedo12.1.1.0')
  # Place tarball on node
  remote_file '/apps/psoft/tuxedo/tuxedo12.tar.gz' do
    owner 'psoft'
    group 'psoft'
    source 'http://pschefserver.timeinc.com:8080/files/tuxedo12.tar.gz'
    action :create
  end

  # extract node only if it has not been extracted already
  execute 'extract_tuxedo12.tar.gz' do
    user 'psoft'
    group 'psoft'
    cwd '/apps/psoft/tuxedo'
    command 'tar -xvf /apps/psoft/tuxedo/tuxedo12.tar.gz;rm tuxedo12.tar.gz'
  end
end
