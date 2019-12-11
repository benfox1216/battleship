require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/board'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new
    @game = Play.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_player_board_is_displayed_showing_hits_misses_and_ships
    skip
    @game.enter_first_coordinates
    @game.enter_second_coordinates

    assert_equal 5, @game.player_board.render(true).count("S")
  end

  def test_computer_board_is_displayed_showing_only_hits_and_misses
    @game.place_computer_ships
    assert_equal 0, @game.computer_board.render.count("S")
  end

  def test_computer_can_choose_a_random_shot
    skip
    @game.enter_first_coordinates
    @game.enter_second_coordinates
    @game.place_computer_ships
    test_board = @game.player_board

    @turn.computer_take_shot(test_board)

    assert_equal true, test_board.render.include?("M") || test_board.render.include?("H")
  end

  def test_computer_does_not_fire_at_same_spot_twice
    16.times do
      @turn.computer_take_shot(@game.player_board)
    end

    assert_equal 16, @game.player_board.render.count("M")
  end

  def test_player_can_choose_a_spot_to_fire
    skip
    @game.enter_first_coordinates
    @game.enter_second_coordinates
    @game.place_computer_ships
    @turn.player_take_shot(@game.computer_board)

    assert_equal true, @game.computer_board.render.include?("M") || @game.computer_board.render.include?("H")
  end

  def test_both_computer_and_player_shots_are_reported_correctly
    skip
    @game.enter_first_coordinates
    @game.enter_second_coordinates
    @game.place_computer_ships

    @game.computer_take_shot
    @game.player_take_shot

    assert_equal 1, @game.player_board.count("M", "H")
    assert_equal 1, @game.computer_board.count("M", "H")
  end
 end
