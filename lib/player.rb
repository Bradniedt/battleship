require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Player
  attr_reader :player_board
  def initialize
    @player_board = Board.new
  end

  def place_ship_2(coordinate_1, coordinate_2)
    if @player_board.board[coordinate_1].occupied? == false && @player_board.board[coordinate_2].occupied? == false
      @player_board.validate_spots_2(coordinate_1, coordinate_2)
    else
      "Those spots are occupied"
    end
  end

  def place_ship_3(coordinate_1, coordinate_2, coordinate_3)
    if @player_board.board[coordinate_1].occupied? == false &&
      @player_board.board[coordinate_2].occupied? == false &&
      @player_board.board[coordinate_3].occupied? == false
      @player_board.validate_spots_3(coordinate_1, coordinate_2, coordinate_3)
    else
      "Those spots are occupied"
    end
  end

    def computer_placement
      possibilities = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      samples = possibilities.sample(2)
      ship1 = [samples[0], (samples[0] + 1)]
      ship1_coordinates = sample_to_coordinate(ship1)
      ship2 = [(samples[1])..(samples[1] + 2)]
      ship2_coordinates = sample_to_coordinate(ship2)
      binding.pry
      place_ship_2(ship1_coordinates[0], ship1_coordinates[1])
      place_ship_3(ship2_coordinates[0]..ship2_coordinates[1])
    end

    def sample_to_coordinate(array)
      array.map do  |num|
        @player_board.coordinates[num]
      end
    end




end
