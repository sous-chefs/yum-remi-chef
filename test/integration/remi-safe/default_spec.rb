if os[:family] == 'centos'
  if os[:release] >= 7
    describe command('php --version') do
      its('stdout') { should match(/5.4/) }
    end
  else
    describe command('php --version') do
      its('stdout') { should match(/5.3/) }
    end
  end
end

if os[:family] == 'fedora'
  describe command('php --version') do
    its('stdout') { should match(/5.6/) }
  end
end
