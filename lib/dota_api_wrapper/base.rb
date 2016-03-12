module DotaApiWrapper
  class Base
    include HTTParty

    BASE_URI = 'http://api.steampowered.com'.freeze
    API_KEY = ENV['STEAM_API_KEY']

    def get(uri, options)
      self.class.get(uri, options)
    end
  end
end
