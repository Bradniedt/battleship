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
    if @player_board.board[coordinate_1].occupied? == false && @player_board.board[coordinate_2].occupied? == false
      @player_board.validate_spots_2(coordinate_1, coordinate_2)
    else
      "Those spots are occupied"
    end
  end

  def place_ship_3(coordinate_1, coordinate_3)
    if @player_board.board[coordinate_1].occupied? == false &&
      # @player_board.board[coordinate_2].occupied? == false &&
      @player_board.board[coordinate_3].occupied? == false
      @player_board.validate_spots_3(coordinate_1, coordinate_3)
    else
      "Those spots are occupied"
    end
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
      # if @player_board.board[coord].hit_status
      #   "It's a hit!"
      # else
      #   "Its a miss!"
      # end
  end
end
