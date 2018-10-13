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
    p "ipsum"
    instruction
  end

  def play
    #display player shots board
    #player make shot
    #display player shots board
    #computer shots
    #display player ships board
    @human.player_board.display_board
    puts "Choose a coordinate to shoot upon!"
    shot_input = gets.chomp
    @human.shot(shot_input)
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
