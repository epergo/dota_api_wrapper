require_relative 'base'

module DotaApiWrapper
  class Player < Base
    base_uri(BASE_URI + '/ISteamUser')

    attr_accessor :steam_id
    attr_accessor :player_info

    def initialize(steam_id)
      @steamid = steam_id
    end

    # If the parameter name exists in the hash, it will be returned
    # In other case in will raise an exception 'NoMethodError'
    def method_missing(name, *args, &block)
      player_info.key?(name.to_s) ? player_info[name.to_s] : super
    end

    def player_info
      @player_info ||= retrieve_info
    end

    def retrieve_info
      query_params = { 'key' => API_KEY, 'steamids' => @steamid }
      api_result = get('/GetPlayerSummaries/v0002', query: query_params, headers: {})

      return if api_result.empty?

      api_result['response']['players'][0]
    end
  end
end
