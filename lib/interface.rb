require './lib/board'
require './lib/ship'
require './lib/player'
require 'pry'

class Interface
  attr_accessor :input, :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
    @start_time
    @end_time
  end

  def instruction
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    input = gets.chomp.downcase
    evaluate_input(input)
  end

  def evaluate_input(input)
    if input == "p"
      play
    elsif  input == "i"
      read_instructions
    elsif input == "q"
      p "Thank you for playing!"
    end
  end

  def read_instructions
    puts "Battleship is a game of blind guesses and educated guesses."
    puts "You will begin by placing two ships on the grid. You place a ship"
    puts "by typing in the coordinates for its bow and stern like this : A1 B1."
    puts "You will have two ships - one is two spaces long (battleship), and"
    puts "the other is three spaces long (destroyer space canoe). "
    puts "After the ships are placed, you can start taking turns at placing"
    puts "shots with the computer. Enter a shot by calling the coordinate letter and number."
    puts  "After each shot, you will get a message telling you"
    puts "that it was a hit or a miss."
    puts "Once all of one player's ship coordinates have been hit, the game is over."
    puts "Have fun!"
    instruction
  end

  def play
    @start_time = Time.now
    p "Pick your 2 spot ship coordinates:"
    print ">"
    user_input_2 = gets.chomp
    user_input_2.upcase!
    inputs2 = user_input_2.split
    human_gets_coordinates_2(inputs2[0], inputs2[1])
    p "Pick your 3 spot ship coordinates:"
    print ">"
    input = gets.chomp
    inputs3 = input.split
    human_gets_coordinates_3(inputs3[0], inputs3[1])
    computer_gets_coordinates
    turn_sequence_loop
  end

  def shot_sequence
    @computer.player_board.display_board
    p "Choose a coordinate to shoot upon!"
    shot_input = gets.chomp
    @computer.human_shot(shot_input, "You")
    @computer.player_board.display_board
    @computer.check_ships
    p "End your turn by pressing ENTER"
    p ">"
    input = gets
    enter(input)
    @computer.human_win_check
    p  "Returning Fire! Beep boop beep..."
    @human.human_shot(@computer.computer_shot_picker, "The Computer")
    @human.player_board.display_board
    @human.check_ships
    @human.computer_win_check
  end


  def turn_sequence_loop
    until (@human.computer_win_check || @computer.human_win_check)
      shot_sequence
    end
    @end_time = Time.now
    p "The game took #{((@end_time - @start_time) / 60).round(2)} minutes to complete."
    quit
  end








  def quit
    p "Thanks for playing!"
  end

  def enter(input)
    if input != "\n"
      p "End your turn by pressing ENTER!!!!!"
      p ">"
      input = gets
      enter(input)
    end
  end

  def human_gets_coordinates_2(coordinate_1, coordinate_2)
    return @human.place_ship_2(coordinate_1, coordinate_2)
  end

  def human_gets_coordinates_3(coordinate_1, coordinate_3)
    return @human.place_ship_3(coordinate_1, coordinate_3)
  end

  def computer_gets_coordinates
    @computer.computer_placement_2
    @computer.computer_placement_3
  end

end
