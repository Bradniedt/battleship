require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game.rb'
require './lib/board.rb'

class PlayerTest < Minitest::Test
  def test_it_exists
    new_player = Player.new
    assert_instance_of Player, new_player
  end

  def test_it_can_see_board
    new_player = Player.new
    assert_instance_of Board, new_player.player_board
  end

  def test_it_can_get_random_coordinates
    new_player = Player.new
    assert_equal 1, new_player.computer_placement 
  end

end
