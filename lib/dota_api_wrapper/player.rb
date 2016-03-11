require_relative "base"

module DotaApiWrapper
  class Player < Base
    base_uri(BASE_URI + "/ISteamUser")

    attr_accessor :steam_id

    def initialize(steam_id)
      @steamid = steam_id
    end

    # If the parameter name exists in the hash, it will be returned
    # In other case in will raise an exception 'NoMethodError'
    def method_missing(name, *args, &block)
      retrieve_info.has_key?(name.to_s) ? retrieve_info[name.to_s] : super
    end

    def retrieve_info
      query_params = { "key" => API_KEY, "steamids" => @steamid }
      self.class.get('/GetPlayerSummaries/v0002', query: query_params, headers: {})["response"]["players"][0]
    end
  end
end
