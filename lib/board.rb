require './lib/ship.rb'
require './lib/player.rb'
require './lib/interface.rb'
require 'pry'

class Board
  attr_reader :board,
              :coordinates,
              :computer_ships,
              :small_ship,
              :big_ship
  def initialize
    @size = 4
    @coordinates = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
    @board = create_board
    @small_ship
    @big_ship
    @computer_ships = []
    @available_coordinates = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
  end

  def create_board
    board = {}
    @coordinates.map do |name|
      board["#{name}"] = " "
    end
    board
  end

  def display_board
    board_spots = @board.values

    puts "==========="
    puts ". 1 2 3 4"
    puts "A #{board_spots.values_at(0,1,2,3).join(" ")}"
    puts "B #{board_spots.values_at(4,5,6,7).join(" ")}"
    puts "C #{board_spots.values_at(8,9,10,11).join(" ")}"
    puts "D #{board_spots.values_at(12,13,14,15).join(" ")}"
    puts "==========="
  end

  def validate_spots_2(coordinate_1, coordinate_2)
   if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
     c1 = coordinate_1.chars
     c2 = coordinate_2.chars
     if (c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1)
       new_ship = Ship.new([coordinate_1, coordinate_2])
       @available_coordinates.delete(coordinate_1)
       @available_coordinates.delete(coordinate_2)
       @small_ship = new_ship
       p "Placed ship!"
     elsif  ((c2[0].ord - c1[0].ord).abs == 1) && (c1[1] == c2[1])
       new_ship = Ship.new([coordinate_1, coordinate_2])
       @available_coordinates.delete(coordinate_1)
       @available_coordinates.delete(coordinate_2)
       @small_ship = new_ship
       p "Placed ship!"
     elsif ((c2[0].ord - c1[0].ord).abs == 3 || c1[1].to_i - c2[1].to_i == 3)
       p "Ships can't wrap around the board, pick again."
       p "Pick your 2 spot ship coordinates:"
       print ">"
       input = gets.chomp
       inputs2 = input.split
       validate_spots_2(inputs2[0], inputs2[1])
     elsif (((c2[0].ord - c1[0].ord).abs == 1) && (c1[1] == c2[1])) ||
       (((c2[0].ord - c1[0].ord).abs == 3) && (c1[1]== c2[1]))
       # !((c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1))
       p "Diagonal placement not allowed, pick again."
       p "Pick your 2 spot ship coordinates:"
       print ">"
       input = gets.chomp
       inputs2 = input.split
       validate_spots_2(inputs2[0], inputs2[1])
     else
       p "I don't know what you did, but pick again."
       p "Pick your 2 spot ship coordinates:"
       print ">"
       input = gets.chomp
       inputs2 = input.split
       validate_spots_2(inputs2[0], inputs2[1])
     end
    else
       p  "One of your coordinates was invalid, pick again."
       p "Pick your 2 spot ship coordinates:"
       print ">"
       input = gets.chomp
       inputs2 = input.split
       validate_spots_2(inputs2[0], inputs2[1])
   end
  end

  def validate_spots_3(coordinate_1, coordinate_3)
    coordinate_2 = find_coord_2(coordinate_1, coordinate_3)
     if actual_spots?(coordinate_1, coordinate_2, coordinate_3) &&
       available_spots?(coordinate_1, coordinate_2, coordinate_3)
       c1 = coordinate_1.chars
       c3 = coordinate_3.chars
         if (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
           coord_2 = find_coord_2(coordinate_1, coordinate_3)
           new_ship = Ship.new([coordinate_1, coordinate_2, coordinate_3])
           @available_coordinates.delete(coordinate_1)
           @available_coordinates.delete(coordinate_2)
           @available_coordinates.delete(coordinate_3)
           @big_ship = new_ship
           new_ship
           p "Placed ship!"
         elsif  ((c3[0].ord - c1[0].ord).abs == 2) && c1[1] == c3[1]
           coord_2 = find_coord_2(coordinate_1, coordinate_3)
           new_ship = Ship.new([coordinate_1, coordinate_2, coordinate_3])
           @available_coordinates.delete(coordinate_1)
           @available_coordinates.delete(coordinate_2)
           @available_coordinates.delete(coordinate_3)
           @big_ship = new_ship
           p "Placed ship!"
         elsif ((c3[0].ord - c1[0].ord).abs == (1 || 2)) || ((c1[1].to_i - c3[1].to_i).abs == 3)
           p "Ships can't wrap around the board, pick again."
           pick_again_3
         elsif (((c3[0].ord - c1[0].ord).abs == (1 || 2)) || ((c1[1].to_i - c3[1].to_i).abs == 1))
           p "Ships can't be placed diagonally, pick again."
           pick_again_3
         else
           p "I don't know what you did, but pick again."
           pick_again_3
         end
     else
         p "One of your coordinates was invalid, pick again."
         pick_again_3
     end
  end

  def comp_validate_2(coordinate_1, coordinate_2)
     if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
       c1 = coordinate_1.chars
       c2 = coordinate_2.chars
     end
     if ((c2[0].ord - c1[0].ord).abs == 1) && c1[1] == c2[1]
       new_ship = Ship.new([coordinate_1, coordinate_2])
       @available_coordinates.delete(coordinate_1)
       @available_coordinates.delete(coordinate_2)
       @small_ship = new_ship
       @computer_ships << @small_ship
       new_ship
     elsif  (c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1)
       new_ship = Ship.new([coordinate_1, coordinate_2])
       @available_coordinates.delete(coordinate_1)
       @available_coordinates.delete(coordinate_2)
       @small_ship = new_ship
       @computer_ships << @small_ship
       new_ship
     else
       computer_random_picker_2
     end
  end

  def comp_validate_3(coordinate_1, coordinate_3)
    coordinate_2 = find_coord_2(coordinate_1, coordinate_3)
      if (@coordinates.include?(coordinate_1) && @coordinates.include?(coordinate_3)) &&
         ((@available_coordinates.include?(coordinate_1) &&
         @available_coordinates.include?(coordinate_2)) &&
         @available_coordinates.include?(coordinate_3))
         c1 = coordinate_1.chars
         c3 = coordinate_3.chars
          if ((c3[0].ord - c1[0].ord).abs == 2) && c1[1].to_i == c3[1].to_i
            coord_2 = find_coord_2(coordinate_1, coordinate_3)
            if !(@available_coordinates.include?(coord_2))
               return computer_random_picker_3
            else
            new_ship = Ship.new([coordinate_1, coordinate_2, coordinate_3])
            @available_coordinates.delete(coordinate_1)
            @available_coordinates.delete(coordinate_2)
            @available_coordinates.delete(coordinate_3)
            @big_ship = new_ship
            @computer_ships << @big_ship
            new_ship
            end
          elsif  (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
            coord_2 = find_coord_2(coordinate_1, coordinate_3)
            if !(@available_coordinates.include?(coord_2))
               return computer_random_picker_3
            else
              new_ship = Ship.new([coordinate_1, coordinate_2, coordinate_3])
              @available_coordinates.delete(coordinate_1)
              @available_coordinates.delete(coordinate_2)
              @available_coordinates.delete(coordinate_3)
              @big_ship = new_ship
              @computer_ships << @big_ship
              new_ship
            end
          else
            computer_random_picker_3
          end
      else
           computer_random_picker_3
      end
  end

  def computer_random_picker_2
      coord_1 = @coordinates.sample
      coord_2 = @coordinates.sample
      comp_validate_2(coord_1, coord_2)
  end

  def computer_random_picker_3
      coord_1 = @available_coordinates.sample
      coord_3 = @available_coordinates.sample
      comp_validate_3(coord_1, coord_3)
  end

  def wrap?(coordinate_1, coordinate_2)
      c1 = coordinate_1.chars
      c2 = coordinate_2.chars
      if ((c2[0].ord - c1[0].ord).abs == 3 || c1[1].to_i - c2[1].to_i == 3)
        true
      else
        false
      end
  end

  def take_shot(coord)
      if @coordinates.include?(coord)
          if @available_coordinates.include?(coord)
            @board["#{coord}"] = "M"
            p "Whiff"
          else
            @board["#{coord}"] = "H"
            p "It's a hit!"
          end
      else
        false
      end
  end

  def find_coord_2(coordinate_1, coordinate_3)
      c1 = coordinate_1.chars
      c3 = coordinate_3.chars
      if c1[0].ord == c3[0].ord
          if c1[1].to_i > c3[1].to_i
            return "#{c3[0]}#{c3[1].to_i + 1}"
          elsif c1[1].to_i < c3[1].to_i
            return "#{c1[0]}#{c1[1].to_i + 1}"
          end
      elsif c1[0].ord > c3[0].ord
          if c1[1].to_i == c3[1].to_i
            return "#{c3[0].next}#{c3[1]}"
          end
      elsif c1[0].ord < c3[0].ord
        if c1[1].to_i == c3[1].to_i
            return "#{c1[0].next}#{c3[1]}"
        end
      end
  end

  def actual_spots?(one, two, three)
    if @coordinates.include?(one)
      if @coordinates.include?(two)
        if @coordinates.include?(three)
          true
        end
      end
    end
  end

  def available_spots?(one, two, three)
    if @available_coordinates.include?(one)
      if @available_coordinates.include?(two)
        if @available_coordinates.include?(three)
          true
        end
      end
    end
  end

  def pick_again_3
    p "Pick your 3 spot ship coordinates:"
    print ">"
    input = gets.chomp
    inputs3 = input.split
    validate_spots_3(inputs3[0], inputs3[1])
  end

end
