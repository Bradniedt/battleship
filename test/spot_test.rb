require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/spot.rb'
require './lib/ship.rb'


class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new("A2")
    assert_instance_of Spot , spot
  end

  def test_it_is_not_occupied_by_default
    spot = Spot.new("A2")
    refute spot.occupied?
  end

  def test_it_can_be_occupied
    spot = Spot.new("A2")
    spot.occupy
    assert spot.occupied?
  end

  def test_its_contents_are_empty
    spot = Spot.new("A2")
    assert_equal " ", spot.contents
  end



end
