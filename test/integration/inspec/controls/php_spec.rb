version = input('version')

control 'php' do
  title 'verify correct version of PHP and repo was installed'

  describe command('php --version') do
    its('stdout') { should match /#{version}/ }
  end

  describe command('dnf module list php') do
    its('stdout') { should match /php +remi-#{version} \[e\]/ }
  end
end
