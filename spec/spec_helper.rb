require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require_relative '../lib/dota'

# Dependencies
require 'vcr'
require 'minitest/autorun'
require 'webmock/minitest'
require 'minitest/reporters'

# Color ouput for minitest results
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

# VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dota_cassettes'
  c.hook_into :webmock

  # Let codeclimate-test-reporter to post coverage results
  c.ignore_hosts 'codeclimate.com'

  # Don't show my API key to the world!
  c.filter_sensitive_data('<API_KEY>') { ENV['STEAM_API_KEY'] }
end
