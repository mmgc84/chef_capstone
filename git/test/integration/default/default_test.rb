describe command('git --version') do
  its('stdout') { should match /git version/ }
end

if os.debian?
  describe package('git') do
    it { should be_installed }
  end
end
