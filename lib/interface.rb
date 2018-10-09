 require './lib/game.rb'

class Interface
  attr_reader :input

  def initialize
    @input
  end

  def instruction
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    @input = gets.chomp
    evaluate_input
  end

  def evaluate_input
    if @input == "p"
      new_game = Game.new
    elsif  @input == "i"
      read_instructions
    elsif @input == "q"
      #quit the game
    end
  end

  def read_instructions
    puts "ipsum"
  end

  def play

  end

  def quit

  end

end
