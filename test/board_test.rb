require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/ship'


class BoardTest < Minitest::Test

  def setup
    @board_one = Board.new
  end

  def test_it_exists
    assert_instance_of Board , @board_one
  end

  def test_it_can_create_board
    assert_instance_of Hash, @board_one.board
  end

  def test_it_can_display_a_spots_content
    assert_equal " ", @board_one.board["A1"]
  end

  def test_it_can_validate_vertical_coordinates
    assert_equal "Placed ship!", @board_one.validate_spots_2("A2", "B2")
  end

  def test_it_can_validate_horizontal_coordinates
    assert_equal "Placed ship!", @board_one.validate_spots_2("A2", "A3")
  end

  def test_it_can_place_3_spot_ship
    assert_equal "Placed ship!", @board_one.validate_spots_3("A2", "A4")
  end

  def test_it_can_place_2_spot_ships_for_computer
    assert_instance_of Ship, @board_one.comp_validate_2("A2", "A3")
  end

  def test_it_can_place_3_spot_ship_for_computer
    assert_instance_of Ship, @board_one.comp_validate_3("A2", "A4")
  end

  def test_it_can_pick_random_coordinates_for_a_2
    assert_instance_of Ship, @board_one.computer_random_picker_2
  end

  def test_it_can_pick_random_coordinates_for_a_3
    assert_instance_of Ship, @board_one.computer_random_picker_3
  end

  def test_it_can_automatically_place_a_2_spot_ship_for_computer
    assert_instance_of Ship, @board_one.comp_validate_2("B3", "A4")
  end

  def test_it_can_automatically_place_3_spot_ship_for_computer
    assert_instance_of Ship, @board_one.comp_validate_2("B2", "A4")
  end

  def test_it_can_create_random_computer_ships
    @board_one.computer_random_picker_2
    @board_one.computer_random_picker_3
    assert_instance_of Ship, @board_one.computer_ships[0]
  end

  def test_it_tells_player_choice_cant_be_diagonal
    expected = "Diagonal placement not allowed, pick again."
    assert_equal expected, @board_one.validate_spots_2("A1", "B2")
  end

  def test_if_player_choice_wraps
    expected = "Ships can't wrap around the board, pick again."
    assert_equal expected, @board_one.validate_spots_2("A4", "B1")
  end

  def test_it_can_display_a_hit
    skip
    @board_one.board["A1"] = "H"
    expected =
  "===========
. 1 2 3 4
A H
B
C
D
==========="
    assert_equal expected, @board_one.display
  end
  def test_shot_sequence_hit
    skip
    #have to pry into this to get it to work
    binding.pry
    assert_equal "It's a hit!", @board_one.take_shot("A1")
  end

  def test_shot_sequence_miss
    skip
    #have to pry into this to get it to work
    binding.pry
    assert_equal "Whiff", @board_one.take_shot("A3")
  end

  def test_it_can_find_horizontal_coordinate_2
    assert_equal "A2", @board_one.find_coord_2("A1", "A3")
  end

  def test_it_can_find_vertical_coordinate_2
    assert_equal "B1", @board_one.find_coord_2("A1", "C1")
  end

  def test_it_can_find_middle_coordinate
    assert_equal "A2", @board_one.find_coord_2("A1", "A3")
  end
end
