#
# Cookbook:: web_domain
# Recipe:: mod_config.wls1212
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase]['WEBSERV'].each do |env_name, env_val|
  env_val.each do |dom_pos, dom_pos_val|
    unless Dir.exist?(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_z' + dom_pos)
      execute 'mod_config_prop_file' do
        user 'psoft'
        group 'psoft'
        #command 'sed -i "s/WebPassword=.*/WebPassword={V1.1}JP9ukEkTsslI\/WN10q0Vtg==/" ' + node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/' + dom_pos_val['WEBSITE_NAME'] + '/configuration.properties'
		command 'echo'
      end

	  ruby_block 'test_xml_parsing' do
        block do
          require 'nokogiri'
          xdoc = Nokogiri::XML.parse(File.open(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/config/config.xml'))
		  servers = xdoc.css('/domain/server') #NodeSet
		  if servers.size > 1
            servers.each do |one_server|
              if one_server.css('/name').inner_text == 'PIA2'
                one_server.css('/listen-port')[0].inner_html = dom_pos_val['HTTP_PORT_2']
                File.write(node['GLOBAL']['WEBLOGIC1212']['PS_HOME'] + '/webserv/' + env_name + '_' + dom_pos + '/config/config.xml', xdoc.to_xml)
              end
            end
          end
        end
		action :run
      end       
    end
  end
end