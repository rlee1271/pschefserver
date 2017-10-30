#
# Cookbook:: web_domain
# Recipe:: webServSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase].each do |env_name, env_val|
  env_val.each do
    template '/apps/psoft/ptools/webserv.silent' + env_name do
      source 'webserv.silent.erb'
      owner 'psoft'
      group 'psoft'
      variables(
        PS_CFG_HOME: node['GLOBAL']['WEBLOGIC1212']['PS_CFG_HOME'],
        DOMAIN_NAME: "#{env_name}_#{env_val['DOMAIN_TYPE']}",
        BEA_HOME: node['GLOBAL']['WEBLOGIC1212']['BEA_HOME'],
        INSTALL_ACTION: env_val['INSTALL_ACTION'],
        SITE_NAME: env_val['SITE_NAME']
      )
    end
  end

  # execute 'execute_webserv' do
  #  user 'psoft'
  #  group 'psoft'
  #  cwd '/apps/psoft/pt854/setup/PsMpPIAInstall'
  #  command './setup.sh -i silent -DRES_FILE_PATH=/apps/psoft/pt854/webserv/webserv.silent'
  # end
end
