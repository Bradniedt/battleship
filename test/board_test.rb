require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board.rb'

class BoardTest < Minitest::Test

  def test_it_exists
    new_board = Board.new()
    assert_instance_of Board , new_board
  end

end
