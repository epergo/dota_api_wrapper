# frozen_string_literal: true
require_relative '../../spec_helper'

describe Dota do
  it 'has a version number' do
    Dota::VERSION.wont_be_empty
  end
end
