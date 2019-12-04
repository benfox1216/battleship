class Cell

  attr_reader :coordinate, :ship, :fired_upon

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
    @fired_upon = true
    @ship.health -= 1 if @ship != nil
  end

  def fired_upon?
    @fired_upon
  end

  def render(*add_ship)
    if add_ship[0] == true
      @has_ship = true
    end
    return "X" if @has_ship == true && @ship.health == 0
    return "H" if @fired_upon == true && @has_ship == true
    return "M" if @fired_upon == true && @has_ship == false
    return "S" if @has_ship == true
    "."
  end
end
