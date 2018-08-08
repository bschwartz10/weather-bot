$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'dotenv'
Dotenv.load
require 'slack-ruby-bot/rspec'
require 'weather-bot'
require 'webmock/rspec'

ENV['RACK_ENV'] = 'test'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<DARK_SKY_API_KEY>') { ENV['DARK_SKY_API_TOKEN']}
end
