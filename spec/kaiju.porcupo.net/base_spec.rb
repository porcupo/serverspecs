require 'spec_helper'

describe "Hostname" do
  this_host = host("porcupo.net")
  it "should resolve to 104.131.11.132" do
    expect(this_host.ipaddress).to eq '104.131.11.132'
  end

  it "should be reachable on ports 22, 80" do
    expect(this_host).to be_reachable.with(:port => 22)
    expect(this_host).to be_reachable.with(:port => 80)
  end
  it "should NOT be reachable on ports 25, 1234" do
    expect(this_host).not_to be_reachable.with(:port => 25)
    expect(this_host).not_to be_reachable.with(:port => 1234)
  end
end

describe "OS" do
  it "should be Ubuntu 14.04 x86_64" do
    expect(os[:family]).to match /^ubuntu$/
    expect(os[:release]).to match /^14.04$/
    expect(os[:arch]).to match /^x86_64$/
  end
end
