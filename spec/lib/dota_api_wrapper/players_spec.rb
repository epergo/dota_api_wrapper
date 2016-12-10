require_relative '../../spec_helper'

describe DotaApiWrapper::Player do
  def setup
    @steamid = '76561197997499174'
  end

  describe 'default attributes' do
    it 'must include httparty methods' do
      DotaApiWrapper::Player.must_include HTTParty
    end

    it 'must have the base url set to Steam Player Summaries endpoint' do
      DotaApiWrapper::Player.base_uri.must_equal 'http://api.steampowered.com/ISteamUser'
    end
  end

  describe 'Get Player Info' do
    let(:player) { DotaApiWrapper::Player.new(@steamid) }

    before do
      VCR.insert_cassette('player', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'retrieve_info' method" do
      player.must_respond_to :retrieve_info
    end

    it 'must parse the api response from JSON to Hash' do
      player.retrieve_info.must_be_instance_of Hash
    end

    it 'must perform the request and get the data of the selected player' do
      player.retrieve_info['steamid'].must_equal player.steamid
    end
  end

  describe 'dynamic attributes' do
    let(:player) { DotaApiWrapper::Player.new(@steamid) }

    before do
      VCR.insert_cassette('player', record: :new_episodes)
      player.retrieve_info
    end

    after do
      VCR.eject_cassette
    end

    it 'must return the attribute value if present in profile' do
      player.steamid.must_equal @steamid
    end

    it 'must raise method missing if attribute is not present' do
      -> { player.foo_attribute }.must_raise NoMethodError
    end
  end
end
