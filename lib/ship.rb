class Ship
  def initialize
    @status = 's'
  end

  def to_s
    @status
  end

  def hit!
    @status = 'x'
  end
end