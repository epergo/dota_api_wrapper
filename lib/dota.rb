require 'dota/version'
require 'httparty'

Dir[File.dirname(__FILE__) + '/dota/*.rb'].each do |file|
  require file
end
