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

  def test_it_creates_player_board
    new_game = Game.new
    assert_instance_of Board, new_game.player_board
  end

  def test_it_creates_computer_board
    new_game = Game.new
    assert_instance_of Board, new_game.computer_board
  end
end
