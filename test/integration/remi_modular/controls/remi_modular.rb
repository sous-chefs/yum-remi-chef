control 'remi-modular' do
  title 'verify remi-modular repo was installed'

  describe yum.repo('remi-modular') do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp case os.name
                 when 'fedora'
                   "http://cdn.remirepo.net/fedora/#{os.release.to_i}/modular/#{os.arch}/mirror"
                 else
                   "http://cdn.remirepo.net/enterprise/#{os.release.to_i}/modular/#{os.arch}/mirror"
                 end
    end
  end
end
