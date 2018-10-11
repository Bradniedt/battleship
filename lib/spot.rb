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

end
