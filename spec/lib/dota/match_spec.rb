# frozen_string_literal: true
require_relative '../../spec_helper'

describe Dota::Match do
  def setup
    @match_info = { 'match_id' => 2_233_484_164, 'match_seq_num' => 1_958_686_385,
                    'start_time' => 1_458_387_219, 'lobby_type' => 0, 'radiant_team_id' => 0,
                    'dire_team_id' => 0, 'players' => [
                      { 'account_id' => 4_294_967_295, 'player_slot' => 0, 'hero_id' => 0 },
                      { 'account_id' => 4_294_967_295, 'player_slot' => 1, 'hero_id' => 0 },
                      { 'account_id' => 210_723_266, 'player_slot' => 2, 'hero_id' => 0 },
                      { 'account_id' => 4_294_967_295, 'player_slot' => 3, 'hero_id' => 0 }
                    ] }
  end

  describe 'default attributes' do
    it 'must include httparty methods' do
      Dota::Match.must_include HTTParty
    end

    it 'must have the base url set to Steam Match Summaries endpoint' do
      Dota::Match.base_uri.must_equal 'http://api.steampowered.com/IDOTA2Match_570'
    end
  end

  describe 'Get Matches' do
    before do
      VCR.insert_cassette('matches', record: :new_episodes)
    end

    after do
      VCR.eject_cassette
    end

    it "must have a 'get_matches' method" do
      Dota::Match.must_respond_to :get_matches
    end

    it 'must parse the api response from JSON to Hash' do
      Dota::Match.get_matches.must_be_instance_of Hash
    end

    it 'must perform the request and get any number of matches' do
      Dota::Match.get_matches['num_results'].wont_be_nil
    end
  end

  describe 'dynamic attributes' do
    let(:match) { Dota::Match.new(@match_info) }

    before do
      VCR.insert_cassette('match', record: :new_episodes)
      match.players
    end

    after do
      VCR.eject_cassette
    end

    it 'must return the attribute value if present' do
      match.match_id.wont_be_nil
    end

    it 'must raise method missing if attribute is not present' do
      -> { match.foo_attribute }.must_raise NoMethodError
    end
  end

  describe 'obtain extra details' do
    let(:match) { Dota::Match.new(@match_info) }

    before do
      VCR.insert_cassette('match', record: :new_episodes)
      match.players
    end

    after do
      VCR.eject_cassette
    end

    it 'must contain "players" Array' do
      match.players.must_be_instance_of Array
    end

    it 'must return full details' do
      match.complete_details['match_id'].wont_be_nil
    end
  end
end
