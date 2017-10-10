#
# Cookbook:: pt854
# Recipe:: prcsSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['TPAFINDPRD2']['PRCS'].each do |k,domain|
   if !File.exists?("/apps/psoft/pt854/appserv/prcs/PRCS/psprcs.cfg")
      template '/apps/psoft/pt854/appserv/createPRCS.pl' do
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
   end

   execute 'execute_FIPASS' do
      cwd '/apps/psoft/pt854/appserv'
      command './createPRCS.pl;rm createPRCS.pl;'
   end
end

