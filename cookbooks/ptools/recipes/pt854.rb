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
  
  cookbook_file node['GLOBAL']['PT854']['PS_HOME'] + '/fonts/truetype/fonts.zip' do
    source 'fonts.zip'
    owner 'psoft'
    group 'psoft'
    mode '0755'
    action :create
  end

  cookbook_file node['GLOBAL']['PT854']['PS_HOME'] + '/appserv/xdo.cfg' do
    source 'xdo.cfg'
    owner 'psoft'
    group 'psoft'
    mode '0755'
    action :create
  end

  execute 'edit-file-with-path-for-cobol' do
    command 'sed -i "s/COBPATH={\$PS_HOME}\/cblbin/COBPATH={\$PS_HOME}\/cblbin:{\$PS_APP_HOME}\/cblbin/g" /apps/psoft/ptools/pt854/appserv/prcs/psprcsrv.ubx'
    action :nothing
  end

  bash 'unzip_fonts' do
    cwd node['GLOBAL']['PS_HOME_854'] + '/fonts/truetype'
    user 'psoft'
    group 'psoft'
    code <<-EOH
      unzip fonts.zip
      rm fonts.zip	
    EOH
  end  
end


template '/apps/psoft/ptools/pt854/psconfig.sh' do
  source 'psconfig854.sh.erb'
  owner 'psoft'
  group 'psoft'
  mode '0755'
  variables(
    PS_HOME: node['GLOBAL']['PT854']['PS_HOME']
  )
end

