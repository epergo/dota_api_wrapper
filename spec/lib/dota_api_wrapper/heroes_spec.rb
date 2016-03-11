require_relative '../../spec_helper'

describe DotaApiWrapper::Heroes do
  describe "default attributes" do
    it "must include httparty methods" do
      DotaApiWrapper::Heroes.must_include HTTParty
    end

    it "must have the base url set to Steam Hero endpoint" do
      DotaApiWrapper::Heroes.base_uri.must_equal "http://api.steampowered.com/IEconDOTA2_570"
    end
  end

  describe "Get All Heroes" do
    let(:heroes) { DotaApiWrapper::Heroes.new }

    before do
      VCR.insert_cassette('heroes', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_heroes' method" do
      heroes.must_respond_to :retrieve_heroes
    end

    it "must parse the api response from JSON to Array" do
      heroes.retrieve_heroes.must_be_instance_of Array
    end

    it "must perform the request and get the data of heroes" do
      heroes.retrieve_heroes.first['id'].must_equal 1
    end
  end
end
