require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_ship_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_ship_has_health_equal_to_length
    assert_equal 3, @cruiser.health
  end

  def test_taking_a_hit_reduces_health
    assert_equal 3, @cruiser.health
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
  end

  def test_if_ship_can_be_sunk
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    @cruiser.hit
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end
end
