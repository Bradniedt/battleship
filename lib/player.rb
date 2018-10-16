require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Player
  attr_reader :player_board, :shoots
  def initialize
    @player_board = Board.new
    @shots = []
    @ships = @player_board.player_ships
  end

  def place_ship_2(coordinate_1, coordinate_2)
    @player_board.validate_spots_2(coordinate_1, coordinate_2)
  end

  def place_ship_3(coordinate_1, coordinate_3)
    @player_board.validate_spots_3(coordinate_1, coordinate_3)
  end

  def computer_placement_2
    @player_board.computer_random_picker_2
  end

  def computer_placement_3
    @player_board.computer_random_picker_3
  end

  def human_shot(coord)
    @shots << coord
    @player_board.valid_coordinate?(coord)
    #if it was a hit, need to store that in an array for comparison to ships.
  end

  def computer_shot
    computer_shot_picker
    @shots << coord
    @player_board.valid_coordinate?(coord)
  end

  def computer_shot_picker
    coord = @player_board.coordinates.sample
    if @shots.include?(coord)
      computer_shot_picker
    else
      return coord
    end
  end

  def check_ships
    #need to call ships to get ship objects, then need to compare the hits
    #against the ship coordinates. if both of a ships coordinates are
    #included in the hits  array, the ship is sunk.
  end

end
