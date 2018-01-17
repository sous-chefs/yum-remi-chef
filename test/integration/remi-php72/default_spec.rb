describe command('php --version') do
  its('stdout') { should match /7.2/ }
end
