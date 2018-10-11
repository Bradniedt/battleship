require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists

    board = Board.new
    assert_instance_of Board , board
  end

  def test_it_can_display_a_board
    skip
    board = Board.new
    board.create_board(4)
    expected =
"===========
. 1 2 3 4
A
B
C
D
==========="
    assert_equal expected, board.display
  end

  def test_it_can_create_board
    board = Board.new
    board.create_board
    assert_instance_of Hash, board.board
  end

  def test_it_can_display_a_spots_content
    board = Board.new
    board.create_board
    assert_equal " ", board.board["A1"].contents 
  end

end
