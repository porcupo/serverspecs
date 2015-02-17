require 'serverspec'
require 'net/ssh'
require 'highline/import'

set :backend, :ssh

if ENV['SUDO_PASSWORD']
  set :sudo_password, ENV['SUDO_PASSWORD']
else
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
end

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

# this should probably be set on an as-needed basis
set :disable_sudo, true

# Set environment variables
set :env, :LANG => 'en_US.UTF-8'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
