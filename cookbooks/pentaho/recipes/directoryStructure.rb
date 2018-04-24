#
# Cookbook Name:: pentaho
# Recipe:: directoryStructure
#
# Copyright 2017, Business systems
#
# All rights reserved - Do Not Redistribute
#

# Create each directory
%w( /apps/psoft /apps/psoft/pentaho /apps/psoft/java).each do |path|
  directory path do
    owner 'psoft'
    group 'psoft'
    mode '0755'
    action :create
  end
end
