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

  def test_it_has_default_length
    new_board = Board.new
    assert_equal 4, new_board.length
  end

  def test_it_has_default_width
    new_board = Board.new
    assert_equal 4, new_board.width
  end

  def test_it_can_create_default_board
    new_board = Board.new
    assert_instance_of Hash, new_board.board_hash
  end

  def test_has_the_correct_hash_length
    new_board = Board.new

    expected = ["1", "2", "3", "4"]

    assert_equal expected, new_board.board_hash.keys
  end

  def test_it_has_the_correct_width
    new_board = Board.new
    assert_equal 4, new_board.board_hash["1"].length
  end

  def test_it_can_display_a_board
    new_board = Board.new
    binding.pry
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
