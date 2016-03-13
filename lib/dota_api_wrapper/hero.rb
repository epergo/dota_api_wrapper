require_relative 'econ'

module DotaApiWrapper
  class Hero < Econ
    attr_accessor :heroes

    def initialize(lang = 'en_us')
      super(lang)
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
