require './lib/spot.rb'
require './lib/ship.rb'
require './lib/player.rb'
require 'pry'

class Board
  attr_reader :board,
              :coordinates,
              :computer_ships,
              :player_ships
  def initialize
    @size = 4
    @coordinates = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
    @board = create_board
    @player_ships = []
    @computer_ships = []
  end

  def create_board
    board = {}
    @coordinates.map do |name|
      board["#{name}"] = Spot.new(name)
    end
    board
  end

  def display
    value = @board.values
    content = value.map do |spot|
    spot.contents
    end
        p
    "===========\n
    . 1 2 3 4
    A #{content.values_at(0,1,2,3).join(" ")}
    B #{content.values_at(4,5,6,7).join(" ")}
    C #{content.values_at(8,9,10,11).join(" ")}
    D #{content.values_at(12,13,14,15).join(" ")}
    ==========="
  end

  def validate_spots_2(coordinate_1, coordinate_2)
   if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
     if vertical?(coordinate_1, coordinate_2)
       new_ship = Ship.new(coordinate_1, coordinate_2)
       @board[coordinate_1].occupy
       @board[coordinate_2].occupy
       @player_ships << new_ship
       new_ship
     elsif  horizontal?(coordinate_1, coordinate_2)
       new_ship = Ship.new(coordinate_1, coordinate_2)
       @board[coordinate_1].occupy
       @board[coordinate_2].occupy
       @player_ships << new_ship
       new_ship
     elsif wrap?(coordinate_1, coordinate_2)
       "Ships can't wrap around the board, pick again."
     elsif !(vertical?(coordinate_1, coordinate_2)) &&
       !(horizontal?(coordinate_1, coordinate_2))
       "Diagonal placement not allowed, pick again."
     else
       "I don't know what you did, but pick again."
     end
   else
     return "One of your coordinates was invalid, pick again."
   end
  end

  def validate_spots_3(coordinate_1, coordinate_3)
    coordinate_2 = find_coord_2(coordinate_1, coordinate_3)
     if (@coordinates.include?(coordinate_1) && @coordinates.include?(coordinate_2) && @coordinates.include?(coordinate_3)) &&
       !(@board[coordinate_1].occupied? && @board[coordinate_2].occupied? && @board[coordinate_3].occupied?)
         if vertical?(coordinate_1, coordinate_3, 2)
           new_ship = Ship.new(coordinate_1, coordinate_3)
           @board[coordinate_1].occupy
           @board[coordinate_2].occupy
           @board[coordinate_3].occupy
           @player_ships << new_ship
           new_ship
         elsif  horizontal?(coordinate_1, coordinate_3, 2)
           new_ship = Ship.new(coordinate_1, coordinate_3)
           @board[coordinate_1].occupy
           @board[coordinate_2].occupy
           @board[coordinate_3].occupy
           @player_ships << new_ship
           new_ship
         elsif wrap?(coordinate_1, coordinate_3)
           "Ships can't wrap around the board, pick again."
         else
           "I don't know what you did, but pick again."
         end
     else
         return "One of your coordinates was invalid, pick again."
     end
  end

  def comp_validate_2(coordinate_1, coordinate_2)
     if @coordinates.include?(coordinate_1) && coordinates.include?(coordinate_2)
       c1 = coordinate_1.chars
       c2 = coordinate_2.chars
     end
     if ((c2[0].ord - c1[0].ord).abs == 1) && c1[1] == c2[1]
       new_ship = Ship.new(coordinate_1, coordinate_2)
       @board[coordinate_1].occupy
       @board[coordinate_2].occupy
       @computer_ships << new_ship
       new_ship
     elsif  (c2[0] == c1[0]) && ((c2[1].to_i - c1[1].to_i).abs == 1)
       new_ship = Ship.new(coordinate_1, coordinate_2)
       @board[coordinate_1].occupy
       @board[coordinate_2].occupy
       @computer_ships << new_ship
       new_ship
     else
       computer_random_picker_2
     end
  end

  def comp_validate_3(coordinate_1, coordinate_3)
      if @coordinates.include?(coordinate_1) && @coordinates.include?(coordinate_3) &&
        !(@board[coordinate_1].occupied? && @board[coordinate_3].occupied?)
         c1 = coordinate_1.chars
         c3 = coordinate_3.chars
          if ((c3[0].ord - c1[0].ord).abs == 2) && c1[1].to_i == c3[1].to_i
           coord_2 = find_coord_2(coordinate_1, coordinate_3)
            if @board[coord_2].occupied?
               return computer_random_picker_3
            else
            new_ship = Ship.new(coordinate_1, coordinate_3)
            @board[coordinate_1].occupy
            @board[coord_2].occupy
            @board[coordinate_3].occupy
            @computer_ships << new_ship
            new_ship
            end
          elsif  (c3[0] == c1[0]) && ((c3[1].to_i - c1[1].to_i).abs == 2)
           coord_2 = find_coord_2(coordinate_1, coordinate_3)
             if @board[coord_2].occupied?
                return computer_random_picker_3
             else
               new_ship = Ship.new(coordinate_1, coordinate_3)
               @board[coordinate_1].occupy
               @board[coord_2].occupy
               @board[coordinate_3].occupy
               @computer_ships << new_ship
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
      coord_1 = @coordinates.sample
      coord_3 = @coordinates.sample
      # binding.pry
      comp_validate_3(coord_1, coord_3)
  end

  def vertical?(coordinate_1, coordinate_2, length = 1)
      c1 = coordinate_1.chars
      c2 = coordinate_2.chars
      if ((c2[0].ord - c1[0].ord).abs == length) && c1[1] == c2[1]
        true
      end
  end

  def horizontal?(coordinate_1, coordinate_2, length = 1)
      c1 = coordinate_1.chars
      c2 = coordinate_2.chars
      if (c2[0] == c1[0]) && (c2[1].to_i - c1[1].to_i).abs == length
        true
      end
  end

  def wrap?(coordinate_1, coordinate_2)
      c1 = coordinate_1.chars
      c2 = coordinate_2.chars
      if (c2[0].ord - c1[0].ord).abs == 3
        true
      elsif c1[1].to_i - c2[1].to_i == 3
        true
      else
        false
      end
  end

  def valid_coordinate?(coord)
      if @coordinates.include?(coord)
          if @board["#{coord}"].occupied?
            @board["#{coord}"].hit
          else
            @board["#{coord}"].miss
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
end
