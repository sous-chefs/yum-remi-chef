describe command('php --version') do
  its('stdout') { should match /5.5/ }
end
