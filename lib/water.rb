class Water
  def initialize
    @status = " "
  end

  def to_s
    @status
  end

  def hit!
    @status = 'o'
  end
end

