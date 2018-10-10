require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board.rb'

class BoardTest < Minitest::Test

  def test_it_exists

    new_board = Board.new
    assert_instance_of Board , new_board
  end

  def test_it_can_display_a_board

    new_board = Board.new
    new_board.create_board(4)
    expected =
"===========
. 1 2 3 4
A
B
C
D
==========="
    assert_equal expected, new_board.display
  end

end
