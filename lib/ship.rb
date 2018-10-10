require "./lib/board.rb"
class Ship
  def initialize(x, y)
    @ship_start = x
    @ship_end = y
    @hit_count = 0
  end

  def gets_hit(coordinate)
    @hit_count += 1
  end

end
