# Cookbook Name:: weblogic
# Recipe:: directoryStructure.rb
#
# Copyright 2017, Business Systems
#
# All rights reserved - Do Not Redistribute
#

%w[/apps/psoft/weblogic /apps/psoft/java].each do |path|
   directory path do
      owner 'psoft'
      group 'psoft'
      action :create
   end
end
