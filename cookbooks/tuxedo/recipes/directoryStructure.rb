#
# Cookbook Name:: tuxedo
# Recipe:: directoryStructure
#
# Copyright 2017, Business systems
#
# All rights reserved - Do Not Redistribute
#

# Create each directory
%w( /apps/psoft /apps/psoft/tuxedo).each do |path|
  directory path do
    owner 'psoft'
    group 'psoft'
    mode '0755'
    action :create
  end
end
