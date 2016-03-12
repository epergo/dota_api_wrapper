require_relative 'base'

module DotaApiWrapper
  class Hero < Base
    base_uri(BASE_URI + '/IEconDOTA2_570')

    attr_accessor :heroes
    attr_accessor :language

    def initialize(lang = 'en_us')
      @language = lang
      @heroes = retrieve_heroes
    end

    def retrieve_heroes
      query_params = { 'key' => API_KEY, 'language' => language }
      api_result = get('/GetHeroes/v0001', query: query_params, headers: {})

      return if api_result.empty?

      res = {}
      api_result['result']['heroes'].each { |a| res[a['id']] = a }

      res
    end

    def find_by_id(id)
      heroes[id]
    end
  end
end
