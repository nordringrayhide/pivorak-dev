control 'redis-server-0' do
  impact 1.0

  title 'ensure redis-server presence'
  describe port(6379) do
    it { is_expected.to be_listening }
  end

  describe service('redis-server') do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'postgresql-0' do
  title 'ensure postgresql presence'
  describe port(5432) do
    it { should be_listening }
  end

  describe service('postgresql') do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'rvm-0' do
  title 'ensure rvm presence'
  impact 1.0
  describe command('. /home/vagrant/.rvm/scripts/rvm && rvm version') do
    its(:exit_status) { is_expected.to be 0 }
  end

  describe command('. /home/vagrant/.rvm/scripts/rvm && ruby --version') do
    its(:exit_status) { is_expected.to be 0 }
    its(:stdout) { is_expected.to include 'ruby 2.3.1' }
  end
end

control 'app-0' do
  impact 1.0

  title 'ensure db:setup populated 4 users'
  describe command("cd /vagrant/pivorak-web-app && . /home/vagrant/.rvm/scripts/rvm && DISABLE_SPRING=1 rvm ruby-2.3.1 do bundle exec rails runner 'puts User.count'") do
    its(:stdout) { is_expected.to be == "4\n" }
  end
end
