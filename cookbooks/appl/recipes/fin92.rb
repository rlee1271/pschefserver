#
# Cookbook:: appl
# Recipe:: fin9.2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'appl::directoryStructure'

# extract node only if it has not been extracted already
unless Dir.exist?('/apps/psoft/appl/fin92-854')
  # Place tarball on node
  remote_file '/apps/psoft/appl/fin92-854.tar.gz' do
    owner 'psoft'
    group 'psoft'
    source 'http://pschefserver.timeinc.com:8080/files/fin92-854.tar.gz'
    action :create
  end

  execute 'fin92-854.tar.gz' do
    user 'psoft'
    group 'psoft'
    cwd '/apps/psoft/appl'
    command 'tar -xvf /apps/psoft/appl/fin92-854.tar.gz;rm fin92-854.tar.gz'
  end
end

unless File.exist?('/home/psoft/setfin92-854')
  template '/home/psoft/setfin92-854' do
    source 'setfin92-854.erb'
    owner 'psoft'
    group 'psoft'
    mode '0755'
    variables(
      ORACLE_SID:      node['setfin92-854']['ORACLE_SID'],
      ORACLE_HOME:     node['GLOBAL']['PT854']['ORACLE_HOME'],
      ORACLE_BASE:     node['GLOBAL']['PT854']['ORACLE_BASE'],
      COBDIR:          node['GLOBAL']['PT854']['COBDIR'],
      TUXDIR:          node['GLOBAL']['PT854']['TUXDIR'],
      PATH:            node['GLOBAL']['PT854']['PATH'],
      LD_LIBRARY_PATH: node['GLOBAL']['PT854']['LD_LIBRARY_PATH'],
      PS_APP_HOME:     node['setfin92-854']['PS_APP_HOME'],
      PS_HOME:         node['GLOBAL']['PT854']['PS_HOME']
    )
  end
end
