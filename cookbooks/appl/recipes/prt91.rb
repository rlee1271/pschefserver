#
# Cookbook:: appl
# Recipe:: portal 9.1
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'appl::directoryStructure'

template '/home/psoft/setprt91-854' do
  source 'setprt91-854.erb'
  owner 'psoft'
  group 'psoft'
  mode '0755'
  variables(
    ORACLE_SID:      node['setprt91-854']['ORACLE_SID'],
    ORACLE_HOME:     node['setprt91-854']['ORACLE_HOME'],
    ORACLE_BASE:     node['GlobalEnv']['ORACLE_BASE'],
    COBDIR:          node['setprt91-854']['COBDIR'],
    TUXDIR:          node['setprt91-854']['TUXDIR'],
    PATH:            node['GlobalEnv']['PATH'],
    LD_LIBRARY_PATH: node['GlobalEnv']['LD_LIBRARY_PATH'],
    PS_APP_HOME:     node['setprt91-854']['PS_APP_HOME']
  )
end
