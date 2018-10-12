require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'


class Game
  attr_reader :human

  def initialize
    @human = Player.new
    @computer = Player.new
  end


  def human_gets_coordinates(coordinate_1, coordinate_2)
    @human.place_ship(coordinate_1, coordinate_2)
    # tell player to tell board to tell spot that it is occupied
    # human.player_board.board["#{coordinate_1}"].occupy
    # human.player_board.board["#{coordinate_2}"].occupy
  end

end
