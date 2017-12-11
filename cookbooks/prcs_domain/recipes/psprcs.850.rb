#
# Cookbook:: prcs_domain
# Recipe:: psprcs.850
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase]['PSPRCS'].each do |env_name, env_val|
  x = 1
  env_val.each do |dom_pos, dom_pos_val|
    unless Dir.exist?(node['GLOBAL']['PS_HOME_850'] + '/appserv/prcs/' + env_name + x.to_s) && dom_pos_val['TOOLS'] == '850'
      template node['GLOBAL']['PS_HOME_850'] + '/appserv/psprcs.cfg' do
        source 'psprcs.850.cfg.erb'
        owner 'psoft'
        group 'psoft'
        variables(
          DBNAME: dom_pos_val['DBNAME'],
          PRCSSRVRNAME: dom_pos
        )
      end

      execute 'import_psprcs_domain_850' do
        user 'psoft'
        group 'psoft'
        cwd node['GLOBAL']['PS_HOME_850'] + '/appserv/'
        command node['GLOBAL']['SET_ENV_850_CRM'] + ' ;psadmin -p import ' + node['GLOBAL']['PS_HOME_850'] + '/appserv/psprcs.cfg -n ' + env_name + x.to_s + ' ;psadmin -p configure -d ' + env_name + x.to_s + ' -u {MSTRSRV}=' + dom_pos_val['MASTER_SCH'] + '%'
      end
    end
    x += 1
  end
end
