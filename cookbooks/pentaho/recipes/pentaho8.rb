#
# Cookbook Name:: pentaho
# Recipe:: pentaho8
#
# Copyright 2018, Business systems
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'pentaho::directoryStructure'

unless Dir.exist?('/apps/psoft/pentaho/data-integration')

  remote_file '/apps/psoft/pentaho/pentaho8.zip' do
    owner 'psoft'
    group 'psoft'
    source 'http://pschefserver.timeinc.com:8080/files/pdi-ce-8.0.0.0-28.zip'
    action :create
  end

  bash 'unzip_pentaho8' do
    cwd '/apps/psoft/pentaho'
    user 'psoft'
    group 'psoft'
    code <<-EOH
      unzip pentaho8.zip
	  rm pentaho8.zip
	EOH
  end
end