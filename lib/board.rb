require './lib/spot.rb'
require './lib/ship.rb'
require './lib/player.rb'
require 'pry'

class Board
  attr_reader :board,
              :coordinates
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
       #&& (!(board[coordinate_1].occupied?) && !(@board[coordinate_1].occupied?)
       c1 = coordinate_1.chars
       c2 = coordinate_2.chars
       # c1, c2
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

   def validate_spots_3(coordinate_1, coordinate_2, coordinate_3)
     if @coordinates.include?(coordinate_1) &&
       coordinates.include?(coordinate_2) &&
       coordinates.include?(coordinate_3)
       #&& (!(board[coordinate_1].occupied?) && !(@board[coordinate_1].occupied?)
       c1 = coordinate_1.chars
       c3 = coordinate_3.chars
       # c1, c2
     end
     if ((c3[0].ord - c1[0].ord).abs == 2) && c1[1] == c3[1]
       new_ship = Ship.new(coordinate_1, coordinate_2, coordinate_3)
       board[coordinate_1].occupy
       board[coordinate_2].occupy
       board[coordinate_3].occupy
       @player_ships << new_ship
       new_ship
     elsif  (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
       new_ship = Ship.new(coordinate_1, coordinate_2, coordinate_3)
       board[coordinate_1].occupy
       board[coordinate_2].occupy
       board[coordinate_3].occupy
       @player_ships << new_ship
       new_ship
     else
       #need reason for invalidity
       return "Invalid coordinates, pick again!"
     end

   end



end


=begin

This allows our current algorithm to work for both computer
and player placement.
computer random coordinate picker:
def computer_random_coordinate_picker
  coord_1 = @coordinates.sample
  coord_2 = @coordinates.sample
  validate_spots(coord_1, coord_2)
end

---------------------------------------------
Dan's Validator

JUST FOR PSEUDOCODE - WILL NEED TO VALIDATE
hash_one{"A1" => 1,"B1" => 5,"C1" => 9,
"D1" => 13,"D2"=> 14,"D3" => 15,"D4" => 16}

hash_two {"A2" => 2, "A3" => 3,"A4" =>, 4,"B2" => 6, "B3" => 7,
"B4" => 8, "C2" => 10, "C3" => 11 , "C4" => 12}

given(coord1, coord2)
board_size = 4 ||  x
hash_two[coord1] % board_size(4) != 0
vertical and horizontal possibilities: (coord1 - 1) || (coord1 + 1) || (coord1 + boardsize(4))
^ add to array to choose from

hash_one[coord1] % board_size(4) == 0
vertical and horizontal possibilities: (coord1 + 1) || (coord1 - boardsize(4))
^ add to array to choose from

=end
