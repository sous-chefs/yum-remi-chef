control 'remi-test' do
  title 'verify remi-test repo was installed'

  describe yum.repo('remi-test') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/test/#{os.arch}/mirror"
    end
  end
end
