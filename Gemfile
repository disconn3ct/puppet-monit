source 'https://rubygems.org'

puppet_version = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.7']

gem 'rake'
gem 'rspec'
gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
gem 'puppet', puppet_version
gem 'puppetlabs_spec_helper'
