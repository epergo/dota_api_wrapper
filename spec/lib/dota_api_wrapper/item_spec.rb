require_relative '../../spec_helper'

describe DotaApiWrapper::Item do
  describe 'default attributes' do
    it 'must include httparty methods' do
      DotaApiWrapper::Item.must_include HTTParty
    end

    it 'must have the base url set to Steam Econ endpoint' do
      DotaApiWrapper::Item.base_uri.must_equal 'http://api.steampowered.com/IEconDOTA2_570'
    end
  end

  describe 'Get All Items' do
    let(:item) { DotaApiWrapper::Item.new }

    before do
      VCR.insert_cassette('items', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_items' method" do
      item.must_respond_to :retrieve_items
    end

    it 'must parse the api response from JSON to Hash' do
      item.retrieve_items.must_be_instance_of Hash
    end

    it 'must perform the request and get the data of items' do
      item.items.wont_be_nil
    end
  end
end
