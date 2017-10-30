#
# Cookbook:: pt854
# Recipe:: appServSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['APPSERV'][node['hostname'].upcase].each do |k,domain|
#   if !Dir.exists?("/apps/psoft/ptools/pt854/appserv/#{domain['DomainName']}")
      template '/apps/psoft/ptools/pt854/appserv/custom.cfx' do
         source 'custom.cfx.erb'
         owner 'psoft'
         group 'psoft'
         variables({
           :DomainName => domain['DomainName'],
           :DBName => domain['DBName'],
           :JSLPort => domain['JSLPort'],
           :JRADPort => domain['JRADPort']
         })
      end

      #execute 'execute_FIPASS' do
      #   cwd '/apps/psoft/ptools/pt854/appserv'
      #   command './createAppServer.pl;rm createAppServer.pl;'
      #end
#   end

   #execute 'change_owner' do
   #   cwd '/apps/psoft/ptools/pt854/appserv/'
   #   command "chown -R psoft:psoft #{domain['DomainName']}"
   #end
end
