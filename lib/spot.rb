require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Spot

  def initialize(name)
    @name = name
    @status = false
    @content = " "
  end

  def occupy
    @status = true
  end

  def occupied?
    @status
  end

  def contents
    @content
  end

  def hit
    @content = "H"
    return "Its a hit!"
  end

  def miss
    @content = "M"
    return "Whiff"
  end

end
