require 'serverspec'
require 'net/ssh'
require 'highline/import'

host = ENV['TARGET_HOST']
options = Net::SSH::Config.for(host)
options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
set :backend, :ssh
set :disable_sudo, true
set :env, :LANG => 'en_US.UTF-8'
