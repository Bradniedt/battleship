class Player
  def initialize
    @player_board = Board.new
    
  end

  def place_ship(coordinate_1, coordinate_2)
    @player_board.validate_spots(coordinate_1, coordinate_2)
  end

end
