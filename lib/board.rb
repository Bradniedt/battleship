require './lib/spot.rb'
require './lib/ship.rb'
require './lib/player.rb'
require 'pry'

class Board
  attr_reader :board,
              :coordinates,
              :computer_ships,
              :player_ships
  def initialize
    @size = 4
    @coordinates = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
    @board = create_board
    @player_ships = []
    @computer_ships = []
  end

  def create_board
    board = {}
    @coordinates.map do |name|
      board["#{name}"] = Spot.new(name)
    end
    board
  end

  def display
    p  "===========\n. 1 2 3 4\nA\nB\nC\nD\n==========="
  end

  def validate_spots_2(coordinate_1, coordinate_2)
   if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
     c1 = coordinate_1.chars
     c2 = coordinate_2.chars
   end
   if ((c2[0].ord - c1[0].ord).abs == 1) && c1[1] == c2[1]
     new_ship = Ship.new(coordinate_1, coordinate_2)
     board[coordinate_1].occupy
     board[coordinate_2].occupy
     @player_ships << new_ship
     new_ship
   elsif  (c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1)
     new_ship = Ship.new(coordinate_1, coordinate_2)
     board[coordinate_1].occupy
     board[coordinate_2].occupy
     @player_ships << new_ship
     new_ship
   else
     #need reason for invalidity
     return "Invalid coordinates, pick again!"
   end
  end

  def validate_spots_3(coordinate_1, coordinate_3)
   if @coordinates.include?(coordinate_1) &&
     coordinates.include?(coordinate_3)
     c1 = coordinate_1.chars
     c3 = coordinate_3.chars
   end
   if ((c3[0].ord - c1[0].ord).abs == 2) && c1[1] == c3[1]
     new_ship = Ship.new(coordinate_1, coordinate_3)
     board[coordinate_1].occupy
     board[coordinate_3].occupy
     @player_ships << new_ship
     new_ship
   elsif  (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
     new_ship = Ship.new(coordinate_1, coordinate_3)
     board[coordinate_1].occupy
     board[coordinate_3].occupy
     @player_ships << new_ship
     new_ship
   else
     #need reason for invalidity
     return "Invalid coordinates, pick again!"
   end
  end

  def comp_validate_2(coordinate_1, coordinate_2)
   if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
     c1 = coordinate_1.chars
     c2 = coordinate_2.chars
   end
   if ((c2[0].ord - c1[0].ord).abs == 1) && c1[1] == c2[1]
     new_ship = Ship.new(coordinate_1, coordinate_2)
     board[coordinate_1].occupy
     board[coordinate_2].occupy
     @computer_ships << new_ship
     new_ship
   elsif  (c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1)
     new_ship = Ship.new(coordinate_1, coordinate_2)
     board[coordinate_1].occupy
     board[coordinate_2].occupy
     @computer_ships << new_ship
     new_ship
   else
     computer_random_picker_2
   end
  end

  def comp_validate_3(coordinate_1, coordinate_3)
   if @coordinates.include?(coordinate_1) &&
     @coordinates.include?(coordinate_3)
     c1 = coordinate_1.chars
     c3 = coordinate_3.chars
   end
   if ((c3[0].ord - c1[0].ord).abs == 2) && c1[1] == c3[1]
     new_ship = Ship.new(coordinate_1, coordinate_3)
     board[coordinate_1].occupy
     board[coordinate_3].occupy
     @computer_ships << new_ship
     new_ship
   elsif  (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
     new_ship = Ship.new(coordinate_1, coordinate_3)
     board[coordinate_1].occupy
     board[coordinate_3].occupy
     @computer_ships << new_ship
     new_ship
   else
     computer_random_picker_3
   end
  end

  def computer_random_picker_2
    coord_1 = @coordinates.sample
    coord_2 = @coordinates.sample
    comp_validate_2(coord_1, coord_2)
  end

  def computer_random_picker_3
    coord_1 = @coordinates.sample
    # coord_2 = @coordinates.sample
    coord_3 = @coordinates.sample
    comp_validate_3(coord_1,coord_3)
  end

end
