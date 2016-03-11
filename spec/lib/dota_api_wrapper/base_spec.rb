require_relative '../../spec_helper'

describe DotaApiWrapper::Base do
  describe "default attributes" do
    it "must include httparty methods" do
      DotaApiWrapper::Base.must_include HTTParty
    end

    it "must have the base url set to Steam endpoint" do
      DotaApiWrapper::Base::BASE_URI.must_equal "http://api.steampowered.com"
    end
  end
end
