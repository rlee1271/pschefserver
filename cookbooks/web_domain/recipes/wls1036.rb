#
# Cookbook:: web_domain
# Recipe:: wls1036
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
# first level is server/node
# second level is weblogic version
# third level is environment name

node[node['hostname'].upcase]['WEBSERV'].each do |ver, ver_val|
  ver_val.each do |env_name, env_val|
    env_val.each do |dom_pos, dom_pos_val|
      if !Dir.exist?(node['GLOBAL']['WEBLOGIC1036']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos) && ver == '1036'
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

        bash 'import_appdomain' do
          cwd node['GLOBAL']['WEBLOGIC1036']['PS_HOME'] + '/setup/PsMpPIAInstall'
          user 'psoft'
          group 'psoft'
          code <<-EOH
            export ORACLE_HOME=#{node['GLOBAL']['PT850']['ORACLE_HOME']}
            export ORACLE_BASE=#{node['GLOBAL']['PT850']['ORACLE_BASE']}
            export TUXDIR=#{node['GLOBAL']['PT850']['TUXDIR']}
            export PATH=$ORACLE_HOME/bin:$TUXDIR/bin:$PATH
            export LD_LIBRARY_PATH=$TUXDIR/lib:$LD_LIBRARY_PATH
            . #{node['GLOBAL']['PS_HOME_850']}/psconfig.sh
            export PS_CFG_HOME=$PS_HOME
            export PS_APP_HOME=$PS_HOME
            export PS_CLASSPATH=$PS_HOME/class:$PS_HOME/appserv/classes/:$PS_APP_HOME/class:$PS_APP_HOME/appserv/classes
            ./setup.sh -i silent -DRES_FILE_PATH=/apps/psoft/ptools/webserv.#{env_name}#{dom_pos}
          EOH
        end

      end
    end
  end
end
