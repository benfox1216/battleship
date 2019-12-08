require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/board'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_creates_a_new_board_each_time_its_called
    assert_instance_of Board, @turn.board
  end

  def test_board_is_rended_blank_at_start_of_game
    board =
    "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"

    assert_equal board, @turn.render
  end

  def test_user_can_input_coordinates
    assert_equal !nil, @turn.place_ships(["A1", "A2", "A3"])
  end

  def test_user_guess_is_rejected_if_already_placed
    @turn.place_ships(["A1", "A2", "A3"])
    assert_equal false, @turn.place_ships(["A1", "A2", "A3"])
  end

  # 2. player needs to be able to input coordinates to fire upon
  #  2.1 print a string with user instructions
  #  2.2 use gets.chomp to collect user input
  #  2.1 take input from user
  #  2.2 validate that is a valid guess
  # =>  2.3 collect an array of previous guesses
  # => confirm the new guess is not within that array
  # => do not execute next step if valid placement does not = true
end



# 4. computer needs to choose a random coordinate to fire upon
#   4.1 computer chooses a random shot
#   4.2 computer does not choose the same shot twice
# 5. an output needs to tell if the shot was a hit or not for both user and
#    computer
# => 5.1 combine this with board render and make sure that board is printed
# => directly after the results are given
