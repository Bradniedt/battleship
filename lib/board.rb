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


end
