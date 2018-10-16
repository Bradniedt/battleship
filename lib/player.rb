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

end
