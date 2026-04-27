control 'remi' do
  title 'verify remi repo was installed'

  describe yum.repo('remi') do
    it { should exist }
    it { should be_enabled }
  end
end
