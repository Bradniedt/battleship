 require './lib/interface.rb'
 require './lib/game.rb'
require './lib/board.rb'
require './lib/ship.rb'
require 'pry'

 # new_interface = Interface.new
 # new_interface.instruction
ship = Ship.new("A2", "A2")
board = Board.new
board.create_board(4)
board.display
