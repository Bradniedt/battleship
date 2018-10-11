require './lib/spot.rb'

class Board
  attr_reader :board
  def initialize
    @size = 4
    @row_1_names = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
    @board
  end

  def create_board
    @board = {}
    @row_1_names.map do |name|
      @board["#{name}"] = Spot.new(name)
    end
  end

    # @row_2_names.map do |name|
    #   name: Spot.new(name)
    # end
    # @row_3_names.map do |name|
    #   name: Spot.new(name)
    # end
    # @row_4_names.map do |name|
    #   name: Spot.new(name)
    # end



   def display
p "==========="
p ". 1 2 3 4"
p "A "
p "B "
p "C "
p "D "
p "==========="
   end



end
