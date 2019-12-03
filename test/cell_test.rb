require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_cell_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_a_cell_can_contain_ship
    assert_nil @cell.ship
    @cell.place_ship(@cruiser)
    assert_instance_of Ship, @cell.ship
  end

  def test_the_cell_is_empty
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end
end
