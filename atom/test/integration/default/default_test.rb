if os.debian?
  describe package('atom') do
    it { should be_installed }
  end
end
