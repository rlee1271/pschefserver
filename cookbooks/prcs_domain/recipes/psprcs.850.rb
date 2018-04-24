#
# Cookbook:: prcs_domain
# Recipe:: psprcs.850
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase]['PSPRCS'].each do |tools, tools_val|
  if tools == '850'
    tools_val.each do |dom_pos, dom_pos_val|
      dom_pos_val.each do |serv_name, serv_name_val|
        unless Dir.exist?(node['GLOBAL']['PS_HOME_850'] + '/appserv/prcs/' + dom_pos)

          template node['GLOBAL']['PS_HOME_850'] + '/appserv/psprcs.cfg' do
            source 'psprcs.850.cfg.erb'
            owner 'psoft'
            group 'psoft'
            variables(
              DBNAME: serv_name_val['DBNAME'],
              PRCSSRVRNAME: serv_name
            )
          end

      	  bash 'import_psprcs_domain_850' do
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
              ./psadmin -p import #{node['GLOBAL']['PS_HOME_850']}/appserv/psprcs.cfg -n #{dom_pos}
              ./psadmin -p configure -d #{dom_pos} -u {MSTRSRV}=#{serv_name_val['MASTER_SCH']} %
      		EOH
      	  end

        end
#	  puts serv_name_val['DBNAME'] + '********************************************************************'
      end
    end  
  end
end
