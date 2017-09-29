#
# Cookbook:: pt854
# Recipe:: monitorWebServ
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['NYCPSAPPP1']['WEBSERV'].each do |k,domain|
   template '/apps/psoft/pt854/webserv/#{domain['DomainName']}#/bin/setEnv.sh' do
      source 'setEnv.sh.erb'
      owner 'root'
      group 'root'
      mode '0755'
      variables({
         :PIAHome => domain['PIAHome'],
         :PSHome => domain['PSHome'],
         :BEA_HOME => domain['BEA_HOME'],
         :WLHome => domain['WLHome'],
         :DomainName => domain['DomainName'],
         :JavaOptionsLinux => domain['JavaOptionsLinux'],
         :AdmHostName => domain['AdmHostName'],
         :AdmServerName => domain['AdmServerName']
      })
   end
end
