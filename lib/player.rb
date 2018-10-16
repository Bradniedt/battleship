require './lib/board'
require './lib/ship'
require './lib/player'
require 'pry'

class Player
  attr_reader :player_board, :shoots
  def initialize
    @player_board = Board.new
    @shots = []
    @ships = [@player_board.small_ship, @player_board.big_ship]
    @shot_coordinates = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
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
    if @shots.include?(coord)
      p "You can't shoot the same spot twice."
      #figure out how to loop back around to pick again
      p "Choose a coordinate to shoot upon!"
      shot_input = gets.chomp
      human_shot(shot_input)
    else
      @shots << coord
      @player_board.take_shot(coord)
    end
    #if it was a hit, need to store that in an array for comparison to ships.
  end

  def computer_shot_picker
    coord = @shot_coordinates.sample
    @shot_coordinates.delete(coord)
    return coord
  end

  def check_ships
    #need to call ships to get ship objects, then need to compare the hits
    #against the ship coordinates. if both of a ships coordinates are
    #included in the hits  array, the ship is sunk.
    ship_spots
    @player_board.small_ship.coordinates.each do |coord|
      ship_spots << coord
    end
    @player_board.big_ship.coordinates.each do |coord|
      ship_spots << coord
    end
    #see which coordinates are hit then compare them to ship length?
    #do this in ship?
  end

end
