require './lib/board'
require './lib/ship'
require './lib/spot'
require './lib/player'
require 'pry'

class Spot
  attr_reader :hit_status

  def initialize(name)
    @name = name
    @status = false
    @content = " "
    @hit_status = false
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
    @hit_status = true
    p "It's a hit!"
  end

  def miss
    @content = "M"
    p "Whiff"
  end

end
