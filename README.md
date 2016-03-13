# DotaApiWrapper
[![Build Status](https://travis-ci.org/epergo/dota_api_wrapper.svg?branch=master)](https://travis-ci.org/epergo/dota_api_wrapper)
[![Code Climate](https://codeclimate.com/github/epergo/dota_api_wrapper/badges/gpa.svg)](https://codeclimate.com/github/epergo/dota_api_wrapper)


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

`heroes = DotaApiWrapper::Hero.new`

`heroes.find_by_id(25) => {"name"=>"npc_dota_hero_lina", "id"=>25, "localized_name"=>"Lina"}`

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests. You can also run `rake console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/epergo/dota_api_wrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
