require './lib/board'
require './lib/ship'
require './lib/player'
require 'pry'

class Player
  attr_accessor :player_board, :shots, :hits
  def initialize
    @player_board = Board.new
    @shots = []
    @hits = 0
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

  def human_shot(coord, name)
    if @shots.include?(coord)
      p "You can't shoot the same spot twice."
      #figure out how to loop back around to pick again
      p "Choose a coordinate to shoot upon!"
      shot_input = gets.chomp
      human_shot(shot_input)
    else
      @shots << coord
      p "#{name} fired at position #{shots.last}."
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
    small_ship_checker
    big_ship_checker
  end

  def small_ship_checker
    if !(@hits > 4)
      if @player_board.small_ship.coordinates.all? {|cord| @shots.include?(cord)}
        @hits += 2
        p "You sunk my battleship!"
      end
    end
  end

  def big_ship_checker
    if !(@hits > 3)
      if @player_board.big_ship.coordinates.all? {|cord| @shots.include?(cord)}
        @hits += 3
        p "You sunk my destroyer space canoe!"
      end
    end
  end

  def human_win_check
    if @hits == 5
      p "You won! It took #{shots.length} shots to win."
      true
    else
      false
    end
  end

  def computer_win_check
    if @hits == 5
      p "The computer won! (You tiny human) It took #{shots.length} shots to win."
      true
    else
      false
    end
  end



end
