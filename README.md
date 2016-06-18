# DotaApiWrapper
[![Build Status](https://travis-ci.org/epergo/dota_api_wrapper.svg?branch=master)](https://travis-ci.org/epergo/dota_api_wrapper)
[![Code Climate](https://codeclimate.com/github/epergo/dota_api_wrapper/badges/gpa.svg)](https://codeclimate.com/github/epergo/dota_api_wrapper)
[![Test Coverage](https://codeclimate.com/github/epergo/dota_api_wrapper/badges/coverage.svg)](https://codeclimate.com/github/epergo/dota_api_wrapper/coverage)
[![Gem Version](https://badge.fury.io/rb/dota_api_wrapper.svg)](https://badge.fury.io/rb/dota_api_wrapper)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dota_api_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dota_api_wrapper

## Steam API Key

In order to use this API first you need to get your API key. You can get it [here](http://steamcommunity.com/dev/apikey)

This gem will read your key from an environment variable, so once you have it you'll need to export it in your environment.

`export STEAM_API_KEY=0123456789`

## Examples of usage

### Heroes

`heroes = DotaApiWrapper::Resource.retrieve_heroes`

    heroes[56] => {
      "name" => "npc_dota_hero_clinkz",
      "id" = >56,
      "localized_name" => "Clinkz"
    }

### Items

`items = DotaApiWrapper::Resource.retrieve_items`

    items[25] => {
      "id" => 25,
      "name" => "item_gloves",
      "cost" => 500,
      "secret_shop" => 0,
      "side_shop" => 1,
      "recipe" => 0,
      "localized_name" => "Gloves of Haste"
    }

### Steam User's Summary

To get all the information of a player you need its 64bits account ID.

`player = DotaApiWrapper::Player.new(76561197997499174)`

Then the first time you access one of its attributes, all the information of the player will be fetched from the API.

Player object has the following information available:

    {
      "steamid"=>"76561197997499174",
      "communityvisibilitystate"=>3,
      "profilestate"=>1,
      "personaname"=>"Kazooie",
      "lastlogoff"=>1458409407,
      "commentpermission"=>1,
      "profileurl"=>"http://steamcommunity.com/id/fdzatone/",
      "avatar"=>"https://steamcdn-a.akamaihd.net/steamcommunity/public/ima  ges/avatars/fa/fa3c7d96ba6f8dc9d7b0820befcd83d53bb3208a.jpg",
      "avatarmedium"=>"https://steamcdn-a.akamaihd.net/steamcommunity/publ  ic/images/avatars/fa/fa3c7d96ba6f8dc9d7b0820befcd83d53bb3208a_medium  .jpg",
      "avatarfull"=>"https://steamcdn-a.akamaihd.net/steamcommunity/public  /images/avatars/fa/fa3c7d96ba6f8dc9d7b0820befcd83d53bb3208a_full.jpg  ",
      "personastate"=>0,
      "primaryclanid"=>"103582791431066484",
      "timecreated"=>1206223343,
      "personastateflags"=>0,
      "loccountrycode"=>"ES",
      "locstatecode"=>"51"
    }

You can access every attribute method-like, for example:

    player.personaname => 'Kazooie'

### Matches

You can query the API in search of the collection of matches you need. For that purpose you can use the method `get_matches` of `DotaApiWrapper::Match` class.

    api_result = DotaApiWrapper::Match.get_matches

`get_matches` Accepts the following options:

    hero_id=<id>                   # Matches with a specific hero
    game_mode=<mode>               # Matches of a given mode
    skill=<skill>                  # 0 for any, 1 for normal, 2 for high, 3 for very high skill (default is 0)
    min_players=<count>            # Minimum number of player
    account_id=<id>                # Search matches of the given ID (32-bit or 64-bit steam ID)
    league_id=<id>                 # Matches of a league
    start_at_match_id=<id>         # Start the search at the indicated match id, descending
    matches_requested=<n>          # Maximum is 25 matches (default is 100)
    tournament_games_only=<string> # Set to only show tournament games

Once you have your collection of matches you can instantiate a `Match` object to work with it.

    match = DotaApiWrapper::Match.new(api_result['matches'].first)
    match.radiant_win => true

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests. You can also run `rake console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/epergo/dota_api_wrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
