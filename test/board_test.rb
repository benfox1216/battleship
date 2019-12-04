require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/board.rb'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
    assert_equal 16, @board.cells.values.count
  end

  def test_it_can_validate_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("A5")
  end
end
