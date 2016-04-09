require_relative '../../spec_helper'

describe DotaApiWrapper::Resource do
  describe 'default attributes' do
    it 'must include httparty methods' do
      DotaApiWrapper::Resource.must_include HTTParty
    end

    it 'must have the base url set to Steam Econ endpoint' do
      DotaApiWrapper::Resource.base_uri.must_equal 'http://api.steampowered.com/IEconDOTA2_570'
    end
  end

  describe 'Get All Heroes' do
    before do
      VCR.insert_cassette('heroes', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_heroes' method" do
      DotaApiWrapper::Resource.must_respond_to :retrieve_heroes
    end

    it 'must parse the api response from JSON to Hash' do
      DotaApiWrapper::Resource.retrieve_heroes.must_be_instance_of Hash
    end

    it 'must perform the request and get the data of heroes' do
      DotaApiWrapper::Resource.retrieve_heroes.wont_be_nil
    end
  end

  describe 'Get All Items' do
    before do
      VCR.insert_cassette('items', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_items' method" do
      DotaApiWrapper::Resource.must_respond_to :retrieve_items
    end

    it 'must parse the api response from JSON to Hash' do
      DotaApiWrapper::Resource.retrieve_items.must_be_instance_of Hash
    end

    it 'must perform the request and get the data of items' do
      DotaApiWrapper::Resource.retrieve_items.wont_be_nil
    end
  end
end
