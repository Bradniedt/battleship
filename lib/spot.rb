class Spot

  def initialize(name)
    @name = name
    @status = false
  end

  def occupy
    @status = true
  end

  def occupied?
    @status
  end


end
