require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/spot.rb'
require './lib/ship.rb'


class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new()
    assert_instance_of Spot , spot
  end

end
