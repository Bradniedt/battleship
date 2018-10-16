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
    new_interface = Interface.new
    binding.pry
    assert_equal "It's a hit!", new_interface.play
  end

end
