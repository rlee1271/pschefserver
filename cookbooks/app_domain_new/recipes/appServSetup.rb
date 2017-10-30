#
# Cookbook:: pt854
# Recipe:: appServSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node[node['hostname'].upcase].each do |_, domain|
  unless Dir.exist?("/apps/psoft/ptools/pt854/appserv/#{domain['DomainName']}")
    template '/apps/psoft/ptools/pt854/appserv/custom.cfx' do
      source 'custom.cfx.erb'
      owner 'psoft'
      group 'psoft'
      variables(
        DomainName: domain['DomainName'],
        DBName:     domain['DBName'],
        JSLPort:    domain['JSLPort']
      )
    end

    execute 'execute_FIPASS' do
      user 'psoft'
      group 'psoft'
      cwd '/apps/psoft/ptools/pt854/appserv'
      command ". /home/psoft/setfin92-854;./psadmin -c create -d #{domain['DomainName']} -t custom.cfx;psadmin -c configure -d #{domain['DomainName']};"
    end
  end
end
