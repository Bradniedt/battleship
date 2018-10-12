require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'


class Game

  def initialize
    @human = Player.new
    @computer = Player.new
  end


  def human_gets_coordinates(coordinate_1, coordinate_2)
    @human.player_board.place_ship(one, two)
  end

end
