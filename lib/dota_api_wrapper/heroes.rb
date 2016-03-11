require_relative "base"

module DotaApiWrapper
  class Heroes < Base
    base_uri(BASE_URI + "/IEconDOTA2_570")

    def retrieve_heroes(language = 'en_us')
      query_params = { "key" => API_KEY, "language" => language }
      self.class.get('/GetHeroes/v0001', query: query_params, headers: {})['result']['heroes']
    end
  end
end
