#
# Cookbook:: pt854
# Recipe:: peopleToolsSetup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

def setup(version,setName)
   if !File.exists?("/apps/psoft/#{version}/readme.txt")
      #Place tarball on node
      remote_file "/apps/psoft/#{version}.tar.gz" do
         source "http://pschefserver.timeinc.com:8080/files/#{version}.tar.gz"
         action :create
      end

      #extract node only if it has not been extracted already
      execute "#{version}.tar.gz" do
         cwd '/apps/psoft'
         command "tar -xvf /apps/psoft/#{version}.tar.gz;rm #{version}.tar.gz"
      end
   end

   template "/apps/psoft/#{version}/psconfig.sh" do
      source 'psconfig.sh.erb'
      variables({
         :PS_HOME => node[version]['PS_HOME']
      })
   end
   
   if (version == "pt850")
      setName = ''
   else
      setName = 'setfin92-854'
   end

   template "/apps/psoft/#{setName}" do
      source "#{setName}.erb"
      owner 'root'
      group 'root'
      mode '0755'
      variables({
        :ORACLE_SID => node[setName]['ORACLE_SID'],
        :ORACLE_HOME => node[setName]['ORACLE_HOME'],
        :ORACLE_BASE => node[setName]['ORACLE_BASE'],
        :COBDIR => node[setName]['COBDIR'],
        :TUXDIR => node[setName]['TUXDIR'],
        :PATH => node[setName]['PATH'],
        :LD_LIBRARY_PATH => node[setName]['LD_LIBRARY_PATH']
      })
   end
end

%w[ /apps/psoft].each do |path|
   directory path do
      action :create
   end
end

if (node['APPSERV'][node['hostname']]['PT850'] == true)
   setup('pt850','')
elsif (node['APPSERV'][node['hostname']]['PT854'] == true)
   setup('pt854','setfin92-854')
end
