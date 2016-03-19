require_relative 'base'

module DotaApiWrapper
  class Match < Base
    base_uri(BASE_URI + '/IDOTA2Match_570')

    attr_accessor :match_info

    def initialize(match_info)
      @match_info = match_info
    end

    # If the parameter name exists in the hash, it will be returned
    # In other case in will raise an exception 'NoMethodError'
    def method_missing(name, *args, &block)
      match_info.key?(name.to_s) ? match_info[name.to_s] : super
    end

    def self.get_matches(options = {})
      api_result = retrieve_info('/GetMatchHistory/V001', options)
      return api_result['result'] unless api_result.empty?
    end
  end
end
