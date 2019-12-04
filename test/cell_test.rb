require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
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

  def test_it_confirms_if_fired_upon
    assert_equal false, @cell.fired_upon?
  end

  def test_fire_upon_reduces_health_by_one_and_confirms_its_been_fired_upon
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_render_returns_a
    assert_equal ".", @cell_1.render
  end

  def test_render_returns_M_once_fired_upon
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_a_ship_is_placed_in_cell_when_render_true
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
    assert_equal "S", @cell_2.render(true)
  end

  def test_a_hit_only_happens_if_a_ship_is_in_place_and_ship_sinks_after_3_hits
    skip
    @cell_2.place_ship(@cruiser)
    assert_equal "S", @cell_2.render(true)
    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end
end
