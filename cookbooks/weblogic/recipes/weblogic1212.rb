# Cookbook Name:: weblogic
# Recipe:: weblogic 12.1.2
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'weblogic::directoryStructure'
include_recipe 'weblogic::jdk1.7'

unless Dir.exist?('/apps/psoft/weblogic/weblogic1212')
  # Place tarball on node
  remote_file '/apps/psoft/weblogic/weblogic1212_with22505331.tar.gz' do
    owner 'psoft'
    group 'psoft'
#    source 'http://pschefserver.timeinc.com:8080/files/weblogic1212.tar.gz'
    source 'http://pschefserver.timeinc.com:8080/files/weblogic1212_with22505331.tar.gz'
    action :create
  end

        bash 'extract_weblogic1212_with22505331.tar.gz' do
          cwd '/apps/psoft/weblogic/'
          user 'psoft'
          group 'psoft'
          code <<-EOH
            tar -xvf /apps/psoft/weblogic/weblogic1212_with22505331.tar.gz
			rm weblogic1212_with22505331.tar.gz
          EOH
        end

  execute 'edit-files-with-path_1212' do
    user 'psoft'
    group 'psoft'
    command 'find /apps/psoft/weblogic/weblogic1212 -name "*.*" -type f -exec grep -Hl "/apps/psoft/weblogic1212" {} \; -exec sed -i "s/\/apps\/psoft\/weblogic1212/\/apps\/psoft\/weblogic\/weblogic1212/g" {} \;'
    action :run
  end

  execute 'edit-files-with-path-java' do
    user 'psoft'
    group 'psoft'
    command 'find /apps/psoft/weblogic/weblogic1212 -name "*.*" -type f -exec grep -Hl "/apps/psoft/temp/wl-install/jdk1.7.0_80" {} \; -exec sed -i "s/\/apps\/psoft\/temp\/wl-install\/jdk1.7.0_80/\/apps\/psoft\/java\/jdk1.7.0_80/g" {} \;'
    action :run
  end

end
