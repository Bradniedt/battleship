require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship.rb'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new(3)
    assert_instance_of Ship , ship
  end

end
