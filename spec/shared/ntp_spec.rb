require 'spec_helper'

shared 'ntp::init' do

  describe package('ntp') do
    it { should be_installed.with_version('4.2.7') }
  end

  describe service('ntp') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(123) do
    it { should be_listening.with('udp') }
  end

  describe file('/etc/default/ntp') do
    it { should be_file }
    # its(:content) { should match /ServerName ['"]#{RSpec.configuration.host}['"]{0,1}/ }
  end

  describe file('/etc/ntp.conf') do
    it { should be_file }
    # compliant
    its(:content) { should match /server\ 10\.\190\.254\.211/ }
    its(:content) { should match /server\ 10\.\190\.254\.212/ }
  end
end
