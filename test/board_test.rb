require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/ship'


class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board , @board
  end

  def test_it_can_display_a_board
    expected =
"===========
. 1 2 3 4
A
B
C
D
==========="
    assert_equal expected, @board.display
  end

  def test_it_can_create_board
    assert_instance_of Hash, @board.board
  end

  def test_it_can_display_a_spots_content
    assert_equal " ", @board.board["A1"].contents
  end

  def test_it_can_validate_vertical_coordinates
    assert_instance_of Ship, @board.validate_spots_2("A2", "B2")
  end

  def test_it_can_validate_horizontal_coordinates
    assert_instance_of Ship, @board.validate_spots_2("A2", "A3")
  end

  def test_it_can_reject_bad_coordinates
    assert_equal "Invalid coordinates, pick again!" , @board.validate_spots_2("A2", "A4")
  end

  def test_it_can_place_3_spot_ship
    assert_instance_of Ship, @board.validate_spots_3("A2", "A4")
  end

  def test_it_can_place_2_spot_ships_for_computer
    assert_instance_of Ship, @board.comp_validate_2("A2", "A3")
  end

  def test_it_can_place_3_spot_ship_for_computer
    assert_instance_of Ship, @board.comp_validate_3("A2", "A4")
  end

  def test_it_can_pick_random_coordinates_for_a_2test_it_can_place_3_spot_ship
    assert_instance_of Ship, @board.computer_random_picker_2
  end

  def test_it_can_pick_random_coordinates_for_a_3test_it_can_place_3_spot_ship
    assert_instance_of Ship, @board.computer_random_picker_3
  end

  def test_it_can_automatically_place_a_2_spot_ship_for_computer
    assert_instance_of Ship, @board.comp_validate_2("B3", "A4")
  end

  def test_it_can_automatically_place_3_spot_ship_for_computer
    assert_instance_of Ship, @board.comp_validate_2("B2", "A4")
  end

  def test_it_can_create_random_computer_ships
    @board.computer_random_picker_2
    @board.computer_random_picker_3
    assert_instance_of Ship, @board.computer_ships[0]
  end

end
