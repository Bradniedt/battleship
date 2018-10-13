require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game.rb'
require './lib/board.rb'

class GameTest < Minitest::Test
  def test_it_exists
    new_game = Game.new
    assert_instance_of Game, new_game
  end

  def test_it_can_place_2spot_ship
    new_game = Game.new
    assert_instance_of Ship, new_game.human_gets_coordinates_2("A2", "A3")
  end

  def test_it_can_place_3spot_ship
    new_game = Game.new
    assert_instance_of Ship, new_game.human_gets_coordinates_3("A1", "A3")
  end

  def test_it_can_place_ship_for_computer
    new_game = Game.new
    assert_instance_of Ship, new_game.computer_gets_coordinates
  end

  def test_it_cant_place_second_ship_on_same_spot
    new_game = Game.new
    new_game.human_gets_coordinates_2("A2", "A3")
    assert_equal "Those spots are occupied", new_game.human_gets_coordinates_2("A2", "A3")
  end

  def test_can_place_ship_with_length_of_3
    new_game = Game.new
    assert_instance_of Ship, new_game.human_gets_coordinates_3("B1", "B3")
  end

  def test_that_computer_can_place_shipt
    new_game = Game.new
    new_game.computer.computer_placement_2
    new_game.computer.computer_placement_3
    assert_instance_of Ship, new_game.computer.player_board.computer_ships[0]
end

end
