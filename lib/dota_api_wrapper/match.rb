require_relative 'base'

module DotaApiWrapper
  class Match < Base
    base_uri(BASE_URI + '/IDOTA2Match_570')

    attr_accessor :match_info
    attr_accessor :match_details

    def initialize(match_info)
      match_info.delete('players')
      @match_info = match_info
    end

    # If the parameter name exists in the hash, it will be returned
    # In other case in will raise an exception 'NoMethodError'
    def method_missing(name, *args, &block)
      if match_info.key?(name.to_s)
        match_info[name.to_s]
      elsif match_details.key?(name.to_s)
        match_details[name.to_s]
      else
        super
      end
    end

    def match_details
      @match_details ||= retrieve_details
    end

    def self.get_matches(options = {})
      api_result = retrieve_info('/GetMatchHistory/V001', options)
      return api_result['result'] unless api_result.empty?
    end

    private

    def retrieve_details
      api_result = self.class.retrieve_info('/GetMatchDetails/V001', match_id: match_id)
      return api_result['result'] unless api_result.empty?
    end
  end
end
