module DotaApiWrapper
  class Base
    include HTTParty

    BASE_URI = 'http://api.steampowered.com'.freeze
    API_KEY = ENV['STEAM_API_KEY']
  end
end
