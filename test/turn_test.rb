require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/turn.rb'
require './lib/board.rb'

class TurnTest < Minitest::Test

  # def setup
  #   @turn = Turn.new
  # end
  #
  # def test_it_exists
  #   assert_instance_of Turn, @turn
  # end
  #
  # def test_turn_creates_a_new_board_each_time_its_called
  #   assert_instance_of Board, @turn.board
  # end
  #
  # def test_board_is_rended_blank_at_start_of_game
  #   board =
  #   "  1 2 3 4 \n" +
  #   "A . . . . \n" +
  #   "B . . . . \n" +
  #   "C . . . . \n" +
  #   "D . . . . \n"
  #
  #   assert_equal board, @turn.render
  # end
  #
  # def test_user_can_input_coordinates
  #   ship_placement = @turn.place_ships(["A1", "A2", "A3"])
  #   require "pry"; binding.pry
  #   assert_equal 3, ship_placement.length
  # end
  #
  # def test_user_guess_is_rejected_if_already_placed
  #   @turn.place_ships(["A1", "A2", "A3"])
  #   assert_equal false, @turn.place_ships(["A1", "A2", "A3"])
  # end
 end
