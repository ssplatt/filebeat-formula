require 'serverspec'

# Required by serverspec
set :backend, :exec

if os['family'] == 'debian'
    describe file('/etc/apt/sources.list.d/elastic-5.x.list') do
      it { should exist }
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
      its(:content) { should match /^deb https:\/\/artifacts\.elastic\.co\/packages\/5\.x\/apt stable main/ }
    end
elsif os['family'] == 'redhat'
    describe file('/etc/yum.repos.d/elastic-5.x') do
      it { should exist }
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
      its(:content) { should match /^https:\/\/artifacts\.elastic\.co\/packages\/5\.x\/yum/ }
    end
end

describe package('filebeat') do
  it { should be_installed }
end

describe service('filebeat') do
  it { should be_enabled }
  it { should be_running }
end
