require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/interface.rb'

class InterfaceTest < Minitest::Test

  def test_it_exists
    new_interface = Interface.new
    assert_instance_of Interface, new_interface
  end

  def test_it_can_evaluate
    skip
    new_interface = Interface.new
    # assert_instance_of Game, new_interface.instruction
    assert_equal "Thank you for playing!", new_interface.instruction
  end

  def test_it_can_perform_a_shot_sequence
    skip
    new_interface = Interface.new
    new_interface.computer_gets_coordinates
    #only way to test if you can get a hit is to
    #pry into the test, call new_interface.computer
    #to see it's ship placements, then exit the pry
    #to choose a coordinate to shoot on.
    binding.pry
    assert_equal "It's a hit!", new_interface.play
  end
  def test_it_can_get_spot_messages
    skip
    new_interface = Interface.new
    binding.pry
    assert_equal "It's a hit!", new_interface.play
  end

  def test_human_can_win_game
    new_interface = Interface.new
    new_interface.computer.hits = 5
    new_interface.computer.shots = ["A1", "B2", "B1", "C2", "D2"]
    expected = "Thanks for playing!"
    assert_equal expected, new_interface.shot_sequence
  end

  def test_computer_can_win_game
    new_interface = Interface.new
    new_interface.human.hits = 5
    new_interface.human.shots = ["A1", "B2", "B1", "C2", "D2"]
    expected = "Thanks for playing!"
    assert_equal expected, new_interface.shot_sequence
  end
  
end
