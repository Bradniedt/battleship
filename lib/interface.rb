require './lib/board'
 require './lib/ship'
 require './lib/spot'
 require './lib/player'
 require 'pry'


class Interface
  attr_accessor :input,:human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def instruction
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    input = gets.chomp
    evaluate_input(input)
  end

  def evaluate_input
    if input == "p"
      @new_game = Game.new
    elsif  input == "i"
      read_instructions
    elsif input == "q"
      p "Thank you for playing!"
    end
  end

  def read_instructions
    p "Battleship is a game of blind guesses and educated guesses.
    You will begin by placing two ships on the grid. You place a ship
    by typing in the coordinates for its bow and stern like this : A1 B1.
    You will have two ships - one is two spaces long, and the other is three
    spaces long. You will place both using two coordinates.
    After the ships are placed, you can start taking turns at placing
    shots with the computer. After each shot, you will get a message telling you
    that it was a hit or a miss.
    Once all of one player's ship coordinates have been hit, the game is over.
    Have fun!"
    instruction
  end

  def play
    #display player shots board
    #player make shot
    #display player shots board
    #computer shots
    #display player ships board
    @human.player_board.display
    puts "Choose a coordinate to shoot upon!"
    shot_input = gets.chomp
    @computer.human_shot(shot_input)
    #human shots are called upon the computer self and vice versa
  end

  def quit

  end

  def human_gets_coordinates_2(coordinate_1, coordinate_2)
    @human.place_ship_2(coordinate_1, coordinate_2)
  end

  def human_gets_coordinates_3(coordinate_1, coordinate_3)
    @human.place_ship_3(coordinate_1, coordinate_3)
  end

  def computer_gets_coordinates
    @computer.computer_placement_2
    @computer.computer_placement_3
  end

end
