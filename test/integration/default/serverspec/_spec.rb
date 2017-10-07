require 'spec_helper'

describe file('/etc/filebeat/filebeat.yml') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 640 }
  its(:sha256sum) { should eq 'c7e736c7cb508dcb18ee6e09e7230da6bfa59667a4a4feb1029d36c5027538f6' }
end
