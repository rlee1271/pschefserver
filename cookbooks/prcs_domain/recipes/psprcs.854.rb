#
# Cookbook:: prcs_domain
# Recipe:: psprcs.854
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase].each do |env_name, env_val|
  env_val.each do |dom_pos, dom_pos_val|
    unless Dir.exist?(node['GLOBAL']['PS_HOME_854'] + '/appserv/prcs/' + env_name + '_' + dom_pos) && dom_pos_val['TOOLS'] == '854'
      template node['GLOBAL']['PS_HOME_854'] + '/appserv/prcs/custom.cfx' do
        source 'custom.854.cfx.erb'
        owner 'psoft'
        group 'psoft'
        variables(
          DBNAME: dom_pos_val['DBNAME'],
          PRCSSRVRNAME: dom_pos
        )
      end

      execute 'execute_create_psprcs_domain_854' do
        user 'psoft'
        group 'psoft'
        cwd node['GLOBAL']['PS_HOME_854'] + '/appserv/'
        command node['GLOBAL']['SET_ENV_854_FIN'] + ' ;psadmin -p create -d ' + env_name + '_' + dom_pos + ' -t custom -ps ' + dom_pos_val['DBNAME'] + ' -env -s silent; psadmin -p configure -d ' + env_name + '_' + dom_pos + ' -u {MSTRSRV}=' + dom_pos_val['MASTER_SCH'] + '%'
      end
    end
  end
end
