require './lib/board.rb'

class Game
  attr_reader :computer_board,
              :player_board
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
  end

end
