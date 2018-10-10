require "./lib/ship.rb"
class Board
  attr_reader :length, :width, :board_hash

  def initialize(ship_one)
    @length = 4
    @board_hash = create_board(@length)
    @ship_one = ship_one
  end

   def create_board(length)
     board = Hash.new
     length.times do |i|
       board["#{i + 1}"] = Array.new(length, " ")
     end
     @board_hash = board
   end

   def display
p "==========="
p ". 1 2 3 4"
p "A #{@board_hash["1"].join(" ")}"
p "B #{@board_hash["2"].join(" ")}"
p "C #{@board_hash["3"].join(" ")}"
p "D #{@board_hash["4"].join(" ")}"
p "==========="
   end

   def registers_hit(coordinate)
     row_hash = {"A" => 1, "B" => 2, "C" => 3, "D" => 4}
     places = coordinate.chars
     row = row_hash[places[0]]
     column = row_hash[places[1]]
     @board_hash[row][column] = "H"
   end





end
