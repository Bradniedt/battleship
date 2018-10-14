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
    new_interface = Interface.new
    new_interface.computer_gets_coordinates
    binding.pry
    assert_equal "It's a hit!", new_interface.play
  end

end
