require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Ship

  def initialize(coordinate_1, coordinate_2)
    @coordinate_1 = coordinate_1
    @coordinate_2 = coordinate_2
    @coordinates = [coordinate_1, coordinate_2]
  end



end
