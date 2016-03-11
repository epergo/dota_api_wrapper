require_relative '../../spec_helper'

describe DotaApiWrapper do
  it 'has a version number' do
    DotaApiWrapper::VERSION.wont_be_empty
  end
end
