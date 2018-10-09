require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/interface.rb'
require './lib/game.rb'
require './lib/board.rb'

class InterfaceTest < Minitest::Test

  def test_it_exists
    new_interface = Interface.new
    assert_instance_of Interface, new_interface
  end

  def test_it_can_evaluate
    new_interface = Interface.new
    # assert_instance_of Game, new_interface.instruction
    assert_equal "Thank you for playing!", new_interface.instruction
  end

end
