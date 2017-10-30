#
# Cookbook:: pt854
# Recipe:: appServSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['APPSERV'][node['hostname'].upcase].each do |k,domain|
   if !Dir.exists?("/apps/psoft/ptools/pt854/appserv/#{domain['DomainName']}")
      template '/apps/psoft/ptools/pt854/appserv/createAppServer.pl' do
         source 'createAppServer.pl.erb'
         owner 'psoft'
         group 'psoft'
         mode '0755'
         variables({
           :DomainName => domain['DomainName'],
           :Size => domain['Size'],
           :DBName => domain['DBName'],
           :DBType => node['GLOBAL']['DBType'],
           :UserId => node['GLOBAL']['UserId'],
           :UserPwd => node['GLOBAL']['UserPwd'],
           :DomainId => domain['DomainName'],
           :AddToPath => node['GLOBAL']['AddToPath'],
           :ConnectId => node['GLOBAL']['ConnectId'],
           :ConnectPwd => node['GLOBAL']['ConnectPwd'],
           :WSLPort => domain['WSLPort'],
           :JSLPort => domain['JSLPort'],
           :JRADPort => domain['JRADPort']
         })
      end

      execute 'execute_FIPASS' do
         cwd '/apps/psoft/ptools/pt854/appserv'
         command './createAppServer.pl;rm createAppServer.pl;'
     end
   end

   execute 'change_owner' do
      cwd '/apps/psoft/'
      #command "chown -R psoft:psoft #{domain['DomainName']}"
      command "chown -R psoft:psoft ptools"
   end
end
