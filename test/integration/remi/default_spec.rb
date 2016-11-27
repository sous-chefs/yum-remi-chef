if os[:family] == 'centos'
  describe command('php --version') do
    its('stdout') { should match /5.4/ }
  end
end

if os[:family] == 'fedora'
  describe command('php --version') do
    its('stdout') { should match /7.0/ }
  end
end
