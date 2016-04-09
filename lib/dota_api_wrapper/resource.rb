require_relative 'base'

module DotaApiWrapper
  class Resource < Base
    base_uri(BASE_URI + '/IEconDOTA2_570')

    def self.retrieve_heroes(language = 'en_us')
      retrieve_resource('heroes', language)
    end

    def self.retrieve_items(language = 'en_us')
      retrieve_resource('items', language)
    end

    private

    def self.retrieve_resource(resource, language = 'en_us')
      return { error: 'specify a resource ("heroes" or "items")' } unless resource

      query_params = { 'key' => API_KEY, 'language' => language }
      action = resource == 'items' ? '/GetGameItems/v0001' : '/GetHeroes/v0001'

      api_result = get(action, query: query_params, headers: {})

      return if api_result.empty?

      res = {}
      api_result['result'][resource].each { |i| res[i['id']] = i }

      res
    end
  end
end
