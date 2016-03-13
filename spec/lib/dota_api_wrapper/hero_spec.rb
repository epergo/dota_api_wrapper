require_relative '../../spec_helper'

describe DotaApiWrapper::Hero do
  describe 'default attributes' do
    it 'must include httparty methods' do
      DotaApiWrapper::Hero.must_include HTTParty
    end

    it 'must have the base url set to Steam Econ endpoint' do
      DotaApiWrapper::Hero.base_uri.must_equal 'http://api.steampowered.com/IEconDOTA2_570'
    end
  end

  describe 'Get All Heroes' do
    let(:hero) { DotaApiWrapper::Hero.new }

    before do
      VCR.insert_cassette('heroes', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_heroes' method" do
      hero.must_respond_to :retrieve_heroes
    end

    it 'must parse the api response from JSON to Hash' do
      hero.retrieve_heroes.must_be_instance_of Hash
    end

    it 'must perform the request and get the data of heroes' do
      hero.heroes.wont_be_nil
    end
  end
end
