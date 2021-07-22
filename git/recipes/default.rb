#
# Cookbook:: git
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform_family?('debian')
  apt_update
  package 'git'
end

# if node['platform_family'] == 'debian'
#   include_recipe 'apt'
#   package 'git'
# end
