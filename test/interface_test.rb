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

end
