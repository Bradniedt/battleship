class Spot
attr_reader :state, :ship_container
  def initialize(state = " ")
    @state = state
    @ship_container
  end

  def gets_hit
    @state = "H"
  end

  def gets_missed
    @state = "M"
  end

  def gets_ship(some_ship)
    @ship_container = some_ship
  end

end
