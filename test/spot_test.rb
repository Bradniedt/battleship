require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/spot.rb'

class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new()
    assert_instance_of Spot , spot
  end

end
