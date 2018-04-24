#
# Cookbook:: web_domain
# Recipe:: mod_config.wls1212
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if !node[node['hostname'].upcase]['WEBSERV'].nil?
node[node['hostname'].upcase]['WEBSERV'].each do |ver, ver_val|
  ver_val.each do |env_name, env_val|
    env_val.each do |dom_pos, dom_pos_val|
      if File.exist?(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/../webserv.' + env_name + dom_pos) && ver == '1212'

        #mod configuration.properties file
        ruby_block 'config_prop_mod' do
	      block do
		    edit_file = Chef::Util::FileEdit.new(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/' + dom_pos_val['WEBSITE_NAME'] + '/configuration.properties')
#            edit_file.search_file_replace_line(/WebPassword=/,'WebPassword={V1.1}JP9ukEkTsslI/WN10q0Vtg==')  #???
#            edit_file.search_file_replace_line(/WebPassword=/,'WebPassword={V1.1}JP9ukEkTssmYrzsK1yvXFg==') 	#PTWEBSERVER		
            edit_file.search_file_replace_line(/WebPassword=/,'WebPassword={V1.1}JP9ukEkTssnvirinHpgG2Q==') #PTWEBSERVER10
            edit_file.write_file
		  end
		  action :run	  
	    end
	  
        #mod config.xml file
        ruby_block 'config_xml_mod' do 
          block do
            require 'nokogiri'
            xmlfile = node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/config/config.xml'
            xdoc = Nokogiri::XML.parse(File.open(xmlfile))
            servers = xdoc.css('/domain/server') #NodeSet
		  
            if servers.size == 1 #for single servers, turn off ssl
              servers.css('/ssl/enabled')[0].inner_html = 'false'
            end
		  
            if servers.size > 1 
              servers.each do |one_server|
                #for multi servers, make sure to input the 2nd server's HTTP port
                if one_server.css('/name').inner_text == 'PIA2' 
                  one_server.css('/listen-port')[0].inner_html = dom_pos_val['HTTP_PORT_2']
                end
                #for multi servers, turn off ssl for PIA1 & PIA2
                if one_server.css('/name').inner_text == 'PIA1' || one_server.css('/name').inner_text == 'PIA2'
                  one_server.css('/ssl/enabled')[0].inner_html = 'false'
                end
              end
            end

            File.write(xmlfile, xdoc.to_xml)
          end
          action :run
        end       

        #mod integrationGateway.properties file with IB Node info
        ruby_block 'intgw_prop_mod' do
          block do
            if dom_pos.include? 'IB'
              edit_file2 = Chef::Util::FileEdit.new(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/applications/peoplesoft/PSIGW.war/WEB-INF/integrationGateway.properties')

              node['INTEGRATION_BROKER'][dom_pos_val['IG_NODES']].each do |ig_name, ig_val|
                edit_file2.insert_line_after_match(/#ig.isc.\$NODENAME.DomainConnectionPwd={V1.1}6O5vpwGxd5o=/,'ig.isc.' + ig_name + '.toolsRel=' + ig_val['toolsRel'])
                edit_file2.insert_line_after_match(/#ig.isc.\$NODENAME.DomainConnectionPwd={V1.1}6O5vpwGxd5o=/,'ig.isc.' + ig_name + '.password=' + node['INTEGRATION_BROKER']['GLOBAL']['PASSWORD'])
                edit_file2.insert_line_after_match(/#ig.isc.\$NODENAME.DomainConnectionPwd={V1.1}6O5vpwGxd5o=/,'ig.isc.' + ig_name + '.userid=' + node['INTEGRATION_BROKER']['GLOBAL']['USERID'])
                edit_file2.insert_line_after_match(/#ig.isc.\$NODENAME.DomainConnectionPwd={V1.1}6O5vpwGxd5o=/,'ig.isc.' + ig_name + '.serverURL=' + ig_val['serverURL'])
                edit_file2.insert_line_after_match(/#ig.isc.\$NODENAME.DomainConnectionPwd={V1.1}6O5vpwGxd5o=/,'#')
              end
              edit_file2.write_file		
            end
          end
          action :run
        end

		bash 'intgw_prop_mod_keystore_pw' do
          cwd node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/applications/peoplesoft/PSIGW.war/WEB-INF'
          user 'psoft'
          group 'psoft'
          code <<-EOH
		    sed -i '0,/secureFileKeystorePasswd=/! {0,/secureFileKeystorePasswd=/ s/secureFileKeystorePasswd=/secureFileKeystorePasswd={V1.1}7m4OtVwXFNyLc1j6pZG69Q==/}' integrationGateway.properties		  
          EOH		
		end
		
        #mod signin.js for UPPERCASE mod
        ruby_block 'signin_js_mod' do
          block do
            edit_file3 = Chef::Util::FileEdit.new(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/applications/peoplesoft/PORTAL.war/' + dom_pos_val['WEBSITE_NAME'] + '/signin.js')
            edit_file3.insert_line_after_match(/var now = new Date\(\);/, '<!-- Time Inc. Addition for LDAP end -->/')
            edit_file3.insert_line_after_match(/var now = new Date\(\);/, 'form.userid.value = form.userid.value.toUpperCase();')
            edit_file3.insert_line_after_match(/var now = new Date\(\);/, '<!-- Time Inc. Addition for LDAP begin -->')
            edit_file3.write_file	
          end
        end
	  
        #update pskey with latest keystore
        cookbook_file node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/piaconfig/keystore/pskey' do
          source 'pskey'
          owner 'psoft'
          group 'psoft'
          action :create
        end

        #delete webserv domain silent creation file
        file node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/../webserv.' + env_name + dom_pos do
          action :delete
          only_if { File.exist? node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/../webserv.' + env_name + dom_pos }
        end
      end
    end
  end
end
end