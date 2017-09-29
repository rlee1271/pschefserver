#
# Cookbook:: pt854
# Recipe:: webServSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['TPAPSAPPD2']['WEBSERV'].each do |k,webserv|
   template '/apps/psoft/pt854/webserv/webserv.silent' do
      source 'webserv.silent.erb'
      owner 'root'
      group 'root'
      mode '0755'
      variables({
         :PsCfgHome => webserv['PsCfgHome'],
         :UserId => webserv['UserId'],
         :UserPwd => webserv['UserPwd'],
         :DomainName => webserv['DomainName'],
         :BEA_HOME => webserv['BEA_HOME'],
         :SingleOrMultiIntall => webserv['SingleOrMultiIntall'],
         :WebSiteName => webserv['WebSiteName'],
         :AppServerName => webserv['AppServerName'],
         :JSLPort => webserv['JSLPort'],
         :HTTPPort => webserv['HTTPPort'],
         :HTTPSPort => webserv['HTTPSPort'],
         :AuthDomain => webserv['AuthDomain'],
         :WebProfName => webserv['WebProfName'],
         :WebProfPwd => webserv['WebProfPwd'],
         :IGWUserId => webserv['IGWUserId'],
         :IGWPwd => webserv['IGWPwd'],
         :ReportsDir => webserv['ReportsDir']
      })
   end

   execute 'execute_webserv' do
      cwd '/apps/psoft/pt854/setup/PsMpPIAInstall'
      command './setup.sh -i silent -DRES_FILE_PATH=/apps/psoft/pt854/webserv/webserv.silent'
   end
end
