#
# Cookbook:: pt854
# Recipe:: prcsSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['PRCS'][node['hostname'].upcase].each do |_,domain|
  unless Dir.exist?("/apps/psoft/ptools/pt854/appserv/prcs/#{domain['DomainName']}")
    template '/apps/psoft/ptools/pt854/appserv/createPRCS.pl' do
      source 'createPRCS.pl.erb'
      owner 'psoft'
      group 'psoft'
      mode '0755'
      variables(
        DomainName: domain['DomainName'],
        DBName: domain['DBName'],
        DBType: node['GLOBAL']['DBType'],
        PrcsServer: domain['PrcsServer'],
        UserId: node['GLOBAL']['UserId'],
        UserPwd: node['GLOBAL']['UserPwd'],
        ConnectId: node['GLOBAL']['ConnectId'],
        ConnectPwd: node['GLOBAL']['ConnectPwd'],
        ServerName: domain['ServerName'],
        LogOutDir: domain['LogOutDir'],
        SqrBin: domain['SqrBin']
      )
    end

    execute 'execute_PRCS' do
      user 'psoft'
      group 'psoft'
      cwd '/apps/psoft/ptools/pt854/appserv/'
      command './createPRCS.pl;rm createPRCS.pl;'
    end
  end
end
