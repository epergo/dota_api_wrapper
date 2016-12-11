require_relative '../../spec_helper'

describe Dota::Base do
  describe 'default attributes' do
    it 'must include httparty methods' do
      Dota::Base.must_include HTTParty
    end

    it 'must have the base url set to Steam endpoint' do
      Dota::Base::BASE_URI.must_equal 'http://api.steampowered.com'
    end
  end
end
