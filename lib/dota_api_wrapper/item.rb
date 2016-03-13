require_relative 'base'

module DotaApiWrapper
  class Item < Base
    base_uri(BASE_URI + '/IEconDOTA2_570')

    attr_accessor :items
    attr_accessor :language

    def initialize(lang = 'en_us')
      @language = lang
      @items = retrieve_items
    end

    def retrieve_items
      query_params = { 'key' => API_KEY, 'language' => language }
      api_result = get('/GetGameItems/v0001', query: query_params, headers: {})

      return if api_result.empty?

      res = {}
      api_result['result']['items'].each { |i| res[i['id']] = i }

      res
    end

    def find_by_id(id)
      items[id]
    end
  end
end
