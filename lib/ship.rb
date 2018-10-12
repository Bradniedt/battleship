require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Ship

  def initialize(coordinate_1, coordinate_2, coordinate_3 = nil)
    @coordinate_1 = coordinate_1
    @coordinate_2 = coordinate_2
    @coordinate_3 = coordinate_3
  end

end
