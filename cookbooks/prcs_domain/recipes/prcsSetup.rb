#
# Cookbook:: pt854
# Recipe:: prcsSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['PRCS'][node['hostname'].upcase].each do |k,domain|
   if !Dir.exists?("/apps/psoft/ptools/pt854/appserv/prcs/#{domain['DomainName']}")
      template '/apps/psoft/ptools/pt854/appserv/createPRCS.pl' do
         source 'createPRCS.pl.erb'
         owner 'psoft'
         group 'psoft'
         mode '0755'
         variables({
            :DomainName => domain['DomainName'],
            :DBName => domain['DBName'],
            :DBType => node['GLOBAL']['DBType'],
            :PrcsServer => domain['PrcsServer'],
            :UserId => node['GLOBAL']['UserId'],
            :UserPwd => node['GLOBAL']['UserPwd'],
            :ConnectId => node['GLOBAL']['ConnectId'],
            :ConnectPwd => node['GLOBAL']['ConnectPwd'],
            :ServerName => domain['ServerName'],
            :LogOutDir => domain['LogOutDir'],
            :SqrBin => domain['SqrBin']
         })
      end

      execute 'execute_PRCS' do
         cwd '/apps/psoft/ptools/pt854/appserv/'
         command './createPRCS.pl;rm createPRCS.pl;'
      end
   end
   
   execute 'change_owner' do
      cwd '/apps/psoft/ptools/pt854/appserv/prcs/'
      command "chown -R psoft:psoft #{domain['DomainName']}"
   end
end

