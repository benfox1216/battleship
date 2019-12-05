class Cell

  attr_reader :coordinate, :fired_upon
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
    @has_ship = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    return true if @ship == nil
    false
  end

  def fire_upon
    @ship.health -= 1
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(*add_ship)
    if add_ship[0] != nil
      @has_ship = true
    end
    
    return "X" if @has_ship == true && @ship.health == 0
    return "H" if @fired_upon == true && @has_ship == true
    return "M" if @fired_upon == true && @has_ship == false
    return "S" if @has_ship == true
    "."

  end
end
