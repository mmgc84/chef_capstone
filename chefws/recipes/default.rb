#
# Cookbook:: chefws
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform_family?('debian')
  puts ">> #{Chef::Config[:file_cache_path]}"
  src = 'https://packages.chef.io/files/stable/chef-workstation/21.2.278/ubuntu/20.04/chef-workstation_21.2.278-1_amd64.deb'
  local_path = "#{Chef::Config[:file_cache_path]}/#{::File.basename(src)}"
  remote_file local_path do
    source src
  end

  dpkg_package local_path

  bashrc_file = '/etc/bash.bashrc'
  file bashrc_file do
    content lazy {
      txt = 'eval "$(chef shell-init bash)"'
      lines = ::File.read(bashrc_file).split("\n")
      lines << txt unless lines.include?(txt)
      lines.join("\n")
    }
  end
end
