require './lib/board'
require './lib/ship'
require './lib/player'
require 'pry'

class Ship
  attr_reader :coordinates
  def initialize(array)
    @coordinates = array
  end
end
