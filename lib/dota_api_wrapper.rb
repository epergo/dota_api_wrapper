require "dota_api_wrapper/version"
require 'httparty'

Dir[File.dirname(__FILE__) + '/dota_api_wrapper/*.rb'].each do |file|
  require file
end
