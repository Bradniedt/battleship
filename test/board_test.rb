require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/ship'


class BoardTest < Minitest::Test

  def test_it_exists


    board = Board.new
    assert_instance_of Board , board
  end

  def test_it_can_display_a_board


    board = Board.new
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
    # board.create_board
    assert_instance_of Hash, board.board
  end

  def test_it_can_display_a_spots_content

    board = Board.new
    # board.create_board
    assert_equal " ", board.board["A1"].contents
  end

  def test_it_can_validate_vertical_coordinates
    board = Board.new
    assert_instance_of Ship, board.validate_spots("A2", "B2")
  end

  def it_can_validate_horizontal_coordinates
    board = Board.new
    assert_instance_of Ship, board.validate_spots("A2", "A3")
  end

end
