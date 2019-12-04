class Cell

  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
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

  def render(has_ship = false)
    return "S" if has_ship == true
    return "M" if @fired_upon == true && has_ship == false
    "."
  end
end
