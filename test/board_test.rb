require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board.rb'
require_relative '../lib/ship.rb'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_board_exists
    skip
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    skip
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
    assert_equal 16, @board.cells.values.count
  end

  def test_it_can_validate_coordinates
    skip
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("A5")
  end

  def test_it_validates_coordinates_equal_to_length
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_validates_coordinates_are_consecutive
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
  end

  def test_it_validates_coordinates_are_not_diagonal
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_it_validates_correct_coordinates_are_valid
    skip
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "C2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_a_ship
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    assert_instance_of Cell, cell_1
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    assert_equal cell_2.ship, cell_1.ship
    assert_equal cell_2.ship, cell_3.ship
  end

  def test_its_the_same_ship_accross_multiple_cells
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_1.ship
    cell_2.ship
    cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_do_not_overlap
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_it_verifies_letters_in_coordinates_are_ascending
    skip
    assert_equal true, @board.check_alphabet(["A", "B", "C"], @cruiser)
    assert_equal false, @board.check_alphabet(["B", "A", "F"], @cruiser)
  end

  def test_it_verifies_numbers_in_coordinates_are_ascending
    assert_equal true, @board.check_numbers(["1", "2", "3"], @cruiser)
    assert_equal false, @board.check_numbers(["2", "1", "5"], @cruiser)
  end
end
