require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'


class Game
  attr_reader :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end


  def human_gets_coordinates_2(coordinate_1, coordinate_2)
    @human.place_ship_2(coordinate_1, coordinate_2)
    # tell player to tell board to tell spot that it is occupied
    # human.player_board.board["#{coordinate_1}"].occupy
    # human.player_board.board["#{coordinate_2}"].occupy
  end

  def human_gets_coordinates_3(coordinate_1, coordinate_3)
    @human.place_ship_3(coordinate_1, coordinate_3)
    # tell player to tell board to tell spot that it is occupied
    # human.player_board.board["#{coordinate_1}"].occupy
    # human.player_board.board["#{coordinate_2}"].occupy
  end

  def computer_gets_coordinates
    @computer.computer_placement
  end

end
