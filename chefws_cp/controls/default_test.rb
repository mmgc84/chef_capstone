control 'Chef Workstation is installed' do
  describe file('/opt/chef-workstation/bin/chef') do
    it { should exist }
  end

  describe command('/opt/chef-workstation/bin/chef --version') do
    its('stdout') { should match /Chef Workstation version: / }
  end
end

control 'Chef Workstation is at least 21.2.278' do
  describe(chefws_version) do
    its('major_version') { should be >= 21 }
    its('minor_version') { should be >= 2 }
    its('patch_version') { should be >= 278 }
  end
end
