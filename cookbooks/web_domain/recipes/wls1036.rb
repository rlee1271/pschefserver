#
# Cookbook:: web_domain
# Recipe:: wls1036
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase].each do |env_name, env_val|
  env_val.each do |dom_pos, dom_pos_val|
    dom_pos_val.each do ||
      unless Dir.exist?(node['GLOBAL']['WEBLOGIC1036']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos)
        template '/apps/psoft/ptools/webserv.' + env_name + dom_pos do
          source 'webserv.silent.erb'
          owner 'psoft'
          group 'psoft'
          variables(
            PS_CFG_HOME: node['GLOBAL']['WEBLOGIC1036']['PS_CFG_HOME'],
            DOMAIN_NAME: "#{env_name}_#{dom_pos}",
            BEA_HOME: node['GLOBAL']['WEBLOGIC1036']['BEA_HOME'],
            INSTALL_ACTION: dom_pos_val['INSTALL_ACTION'],
            DOMAIN_TYPE: dom_pos_val['DOMAIN_TYPE'],
            INSTALL_TYPE: dom_pos_val['INSTALL_TYPE'],
            WEBSITE_NAME: dom_pos_val['WEBSITE_NAME'],
            APPSERVER_NAME: dom_pos_val['APPSERVER_NAME'],
            JSL_PORT: dom_pos_val['JSL_PORT'],
            HTTP_PORT: dom_pos_val['HTTP_PORT']
          )
        end
        execute 'execute_webserv_setup' do
          user 'psoft'
          group 'psoft'
          cwd node['GLOBAL']['WEBLOGIC1036']['PS_HOME'] + '/setup/PsMpPIAInstall'
          command './setup.sh -i silent -DRES_FILE_PATH=/apps/psoft/ptools/webserv.' + env_name + dom_pos
        end
      end
    end
  end
end
