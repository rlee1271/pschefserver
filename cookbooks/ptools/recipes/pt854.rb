#
# Cookbook:: ptools
# Recipe:: pt8.54
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'ptools::directoryStructure'

unless Dir.exist?('/apps/psoft/ptools/pt854')
  remote_file '/apps/psoft/ptools/pt854.tar.gz' do
    source 'http://pschefserver.timeinc.com:8080/files/pt854.tar.gz'
    action :create
  end

  # extract node only if it has not been extracted already
  execute 'pt854.tar.gz' do
    cwd '/apps/psoft/ptools'
    command 'tar -xvf /apps/psoft/ptools/pt854.tar.gz;rm pt854.tar.gz'
    notifies :run, 'execute[edit-file-with-path-for-cobol]', :delayed
  end
end

execute 'edit-file-with-path-for-cobol' do
  command 'sed -i "s/COBPATH={\$PS_HOME}\/cblbin/COBPATH={\$PS_HOME}\/cblbin:{\$PS_APP_HOME}\/cblbin/g" /apps/psoft/ptools/pt854/appserv/prcs/psprcsrv.ubx'
  action :nothing
end

template '/apps/psoft/ptools/pt854/psconfig.sh' do
  source 'psconfig854.sh.erb'
  owner 'psoft'
  group 'psoft'
  mode '0755'
  variables(
    PS_HOME: node['pt854']['PS_HOME']
  )
end
