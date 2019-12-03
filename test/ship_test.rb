require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    @cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name

  end

  def test_ship_has_a_length
    assert_equal 3, @cruiser.length
  end
end
