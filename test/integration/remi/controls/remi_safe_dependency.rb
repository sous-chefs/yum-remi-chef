control 'remi-safe-dependency' do
  title 'verify yum_remi only manages remi-safe on RHEL family platforms'

  if os.name == 'fedora'
    describe yum.repo('remi-safe') do
      it { should_not exist }
    end
  else
    describe yum.repo('remi-safe') do
      it { should exist }
      it { should be_enabled }
    end
  end
end
