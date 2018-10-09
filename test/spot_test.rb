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

  def test_it_default_state
      spot = Spot.new()
      assert_equal " ", spot.state
  end

  def test_state_changes_when_hit
      spot = Spot.new()
      spot.gets_hit
      assert_equal "H", spot.state
  end

  def test_state_changes_when_missed
      spot = Spot.new()
      spot.gets_missed
      assert_equal "M", spot.state
  end

  def test_spot_has_ship
      spot = Spot.new()
      ship = Ship.new(2)
      spot.gets_ship(ship)
      assert_instance_of Ship, spot.ship_container
  end

end
