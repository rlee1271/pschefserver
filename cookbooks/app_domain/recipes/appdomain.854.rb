#
# Cookbook:: app_domain
# Recipe:: appdomain.854
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase].each do |toolsver, toolsver_val|
  toolsver_val.each do |dom_pos, dom_pos_val|
    unless Dir.exist?(node['GLOBAL']['PS_HOME_854'] + '/appserv/' + dom_pos) && toolsver == '854'
      template node['GLOBAL']['PS_HOME_854'] + '/appserv/psappsrv.cfg' do
        source 'psappsrv.854.erb'
        owner 'psoft'
        group 'psoft'
        variables(
          DBNAME:     dom_pos_val['DBNAME'],
          JSLPORT:    dom_pos_val['JSLPORT'],
          DOMAINNAME: dom_pos
        )
      end

      execute 'execute_import_appdomain' do
        user 'psoft'
        group 'psoft'
        cwd node['GLOBAL']['PS_HOME_854'] + '/appserv'
        command '. /home/psoft/setfin92-854;./psadmin -c import ' + node['GLOBAL']['PS_HOME_854'] + '/appserv/psappsrv.cfg -n ' + dom_pos
      end

      execute 'execute_config_appdomain' do
        user 'psoft'
        group 'psoft'
        cwd node['GLOBAL']['PS_HOME_854'] + '/appserv'
        command '. /home/psoft/setfin92-854;./psadmin -c configure -d ' + dom_pos + ' -u {RENSRV}=' + dom_pos_val['RENSRV'] + '%' + '{PUBSUB}=' + dom_pos_val['PUBSUB'] + '%'
      end
    end
  end
end
