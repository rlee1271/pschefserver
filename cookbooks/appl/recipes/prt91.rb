#
# Cookbook:: appl
# Recipe:: portal 9.1
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'appl::directoryStructure'

unless File.exist?('/home/psoft/setprt91-854')
  template '/home/psoft/setprt91-854' do
    source 'setprt91-854.erb'
    owner 'psoft'
    group 'psoft'
    mode '0755'
    variables(
      ORACLE_SID:      'PAEX',
      ORACLE_HOME:     node['GLOBAL']['PT854']['ORACLE_HOME'],
      ORACLE_BASE:     node['GLOBAL']['PT854']['ORACLE_BASE'],
      COBDIR:          node['GLOBAL']['PT854']['COBDIR'],
      TUXDIR:          node['GLOBAL']['PT854']['TUXDIR'],
      PATH:            node['GLOBAL']['PT854']['PATH'],
      LD_LIBRARY_PATH: node['GLOBAL']['PT854']['LD_LIBRARY_PATH'],
      PS_APP_HOME:     '$PS_HOME',
      PS_HOME:         node['GLOBAL']['PT854']['PS_HOME']
    )
  end
end