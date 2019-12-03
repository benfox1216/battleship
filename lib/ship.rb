class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
  end

  def hit
    return 0 if @health == 0
    @health -= 1
  end 

  def sunk?
    return true if @health == 0
    false
  end
end
