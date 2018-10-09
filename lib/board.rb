class Board
  attr_reader :length, :width, :board_hash

  def initialize
    @length = 4
    @width = 4
    @board_hash = create_board(@length, @width)
  end

   def create_board(length, width)
     board = Hash.new
     length.times do |i|
       board["#{i + 1}"] = Array.new(width, " ")
     end
     @board_hash = board
   end

   def display

     # p ". 1 2 3 4"
     # p "A #{@board_hash["1"].map {|i| print " #{i}"}}"
     # p "B #{@board_hash["2"].map {|i| print " #{i}"}}"
     # p "C #{@board_hash["3"].map {|i| print " #{i}"}}"
     # p "D #{@board_hash["4"].map {|i| print " #{i}"}}"
p
"===========
. 1 2 3 4
A#{@board_hash["1"]}
B
C
D
==========="
   end




end
