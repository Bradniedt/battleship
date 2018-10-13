require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game.rb'
require './lib/board.rb'

class PlayerTest < Minitest::Test
  def setup
    @new_player = Player.new
  end

  def test_it_exists
    assert_instance_of Player, @new_player
  end

  def test_it_can_see_board
    assert_instance_of Board, @new_player.player_board
  end

  def test_it_can_place_a_two_spot_ship
    assert_instance_of Ship, @new_player.place_ship_2("A1", "A2")
  end

  def test_it_can_place_a_three_spot_ship
    assert_instance_of Ship, @new_player.place_ship_3("A1", "A3")
  end

  def test_it_can_place_random_2_spot_ships_for_computer
    assert_instance_of Ship, @new_player.computer_placement_2
  end

  def test_it_can_place_random_3_spot_ships_for_computer
    assert_instance_of Ship, @new_player.computer_placement_3
  end

end
