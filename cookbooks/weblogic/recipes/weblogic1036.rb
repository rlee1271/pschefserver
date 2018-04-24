# Cookbook Name:: weblogic
# Recipe:: weblogic 10.3.6
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'weblogic::directoryStructure'
include_recipe 'weblogic::jdk1.7'

unless Dir.exist?('/apps/psoft/weblogic/weblogic1036')
  # Place tarball on node
  remote_file '/apps/psoft/weblogic/weblogic1036_FMJJ.tar.gz' do
    owner 'psoft'
    group 'psoft'
    source 'http://pschefserver.timeinc.com:8080/files/weblogic1036_FMJJ.tar.gz'
    action :create
  end

  bash 'extract_weblogic1036_FMJJ.tar.gz' do
    cwd '/apps/psoft/weblogic/'
    user 'psoft'
    group 'psoft'
    code <<-EOH
    tar -xvf /apps/psoft/weblogic/weblogic1036_FMJJ.tar.gz
    rm weblogic1036_FMJJ.tar.gz
    EOH
  end
  
  # extract node only if it has not been extracted already
#  execute 'extract_weblogic1036.tar' do
#    user 'psoft'
#    group 'psoft'
#    cwd '/apps/psoft/weblogic'
#    command 'tar -xvf /apps/psoft/weblogic/weblogic1036.tar;rm weblogic1036.tar'
#    notifies :run, 'execute[edit-files-with-path_1036]', :delayed
    # notifies :run, 'execute[edit-files-with-path-java]', :delayed
#  end

  execute 'edit-files-with-path_1036' do
    user 'psoft'
    group 'psoft'
    command 'find /apps/psoft/weblogic/weblogic1036 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1036" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1036/\/apps\/psoft\/weblogic\/weblogic1036/g" {} \;'
    action :nothing
  end

  execute 'edit-files-with-path-java' do
    user 'psoft'
    group 'psoft'
    command 'find /apps/psoft/weblogic/weblogic1036 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1036/jdk1.7.0_09" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1036\/jdk1.7.0_09/\/apps\/psoft\/java\/jdk1.7.0_80/g" {} \;'
    action :nothing
  end
end
