 require './lib/game.rb'

class Interface
  attr_accessor :input #might need to be changed back to reader

  def initialize
    @input
    @new_game
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
      @new_game = Game.new
    elsif  @input == "i"
      read_instructions
    elsif @input == "q"
      p "Thank you for playing!"
    end
  end

  def read_instructions
    p "ipsum"
  end

  def play

  end

  def quit

  end

end
