require 'spec_helper'

describe file('/etc/filebeat/filebeat.yml') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 640 }
  its(:content) { should match /^filebeat:/ }
  its(:content) { should match /^  prospectors:/ }
  its(:content) { should match /input_type: log$/ }
  its(:content) { should match /paths:$/ }
  its(:content) { should match /^    - \/var\/log\/\*\.log/ }
  its(:content) { should match /^  registry_file: \/var\/lib\/filebeat\/registry/ }
  its(:content) { should match /^logging:/ }
  its(:content) { should match /^  files:/ }
  its(:content) { should match /^    keepfiles: 2/ }
  its(:content) { should match /^    name: filebeat\.log/ }
  its(:content) { should match /^    path: \/var\/log\/filebeat/ }
  its(:content) { should match /^  to_files: true/ }
  its(:content) { should match /^  to_syslog: false/ }
  its(:content) { should match /^output:/ }
  its(:content) { should match /^  file:/ }
  its(:content) { should match /^    filename: filebeat/ }
  its(:content) { should match /^    path: \/tmp\/filebeat/ }
end
