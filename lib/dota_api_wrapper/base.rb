module DotaApiWrapper
  class Base
    include HTTParty

    BASE_URI = 'http://api.steampowered.com'.freeze
    API_KEY = ENV['STEAM_API_KEY']

    def get(uri, options)
      self.class.get(uri, options)
    end

    def self.retrieve_info(action, options = {})
      query_params = { 'key' => API_KEY }.merge(options)
      get(action, query: query_params, headers: {})
    end
  end
end
