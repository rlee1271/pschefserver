#
# Cookbook:: ptools
# Recipe:: directoryStructure
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w( /apps/psoft /apps/psoft/ptools).each do |path|
  directory path do
    owner 'psoft'
    group 'psoft'
    mode '0755'
    action :create
  end
end
