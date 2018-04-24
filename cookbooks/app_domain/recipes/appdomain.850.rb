#
# Cookbook:: app_domain
# Recipe:: appdomain.850
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if !node[node['hostname'].upcase]['APPSERV'].nil?
node[node['hostname'].upcase]['APPSERV'].each do |toolsver, toolsver_val|
  toolsver_val.each do |dom_pos, dom_pos_val|
    if !Dir.exist?(node['GLOBAL']['PS_HOME_850'] + '/appserv/' + dom_pos) && toolsver == '850'
      template node['GLOBAL']['PS_HOME_850'] + '/appserv/psappsrv.cfg' do
        source 'psappsrv.850.erb'
        owner 'psoft'
        group 'psoft'
        variables(
          DBNAME:     dom_pos_val['DBNAME'],
          JSLPORT:    dom_pos_val['JSLPORT'],
          DOMAINNAME: dom_pos
        )
      end

	  bash 'import_appdomain' do
        cwd node['GLOBAL']['PS_HOME_850'] + '/appserv'
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
          ./psadmin -c import #{node['GLOBAL']['PS_HOME_850']}/appserv/psappsrv.cfg -n #{dom_pos}
          ./psadmin -c configure -d #{dom_pos} -u {RENSRV}=#{dom_pos_val['RENSRV']}%{PUBSUB}=#{dom_pos_val['PUBSUB']}%
		  EOH
	  end
	  
#      execute 'execute_import_appdomain' do
#        user 'psoft'
#        group 'psoft'
#        cwd node['GLOBAL']['PS_HOME_850'] + '/appserv'
#        command '. /home/psoft/setcrm88-850;./psadmin -c import ' + node['GLOBAL']['PS_HOME_850'] + '/appserv/psappsrv.cfg -n ' + dom_pos
#      end

#      execute 'execute_config_appdomain' do
#        user 'psoft'
#        group 'psoft'
#        cwd node['GLOBAL']['PS_HOME_850'] + '/appserv'
#        command '. /home/psoft/setcrm88-850;./psadmin -c configure -d ' + dom_pos + ' -u {RENSRV}=' + dom_pos_val['RENSRV'] + '%' + '{PUBSUB}=' + dom_pos_val['PUBSUB'] + '%'
#      end
    end
  end
end
end