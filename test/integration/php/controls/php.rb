version = input('version')

control 'php' do
  title 'verify the selected PHP module stream is enabled'

  describe command('php --version') do
    its('stdout') { should match(/#{Regexp.escape(version)}/) }
  end

  describe command('dnf module list php') do
    its('stdout') { should match(/php +remi-#{Regexp.escape(version)} \[e\]/) }
  end
end
