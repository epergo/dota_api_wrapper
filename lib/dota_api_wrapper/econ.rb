require_relative 'base'

module DotaApiWrapper
  class Econ < Base
    base_uri(BASE_URI + '/IEconDOTA2_570')

    attr_accessor :language

    def initialize(lang = 'en_us')
      @language = lang
    end
  end
end
