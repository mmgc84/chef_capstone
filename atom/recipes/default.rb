#
# Cookbook:: atom
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform_family?('debian')
  apt_repository 'atom' do
    key 'https://packagecloud.io/AtomEditor/atom/gpgkey'
    uri 'https://packagecloud.io/AtomEditor/atom/any/'
    arch 'amd64'
    distribution 'any'
    components ['main']
  end
  package 'atom'
end
