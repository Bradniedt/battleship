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

  

end
