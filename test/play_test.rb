require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/play'

class PlayTest < Minitest::Test

  def setup
    @game = Play.new
  end

  def test_it_exists

  end

  def test_it_has_attributes

  end

  def test_a_player_can_quit

  end

  def test_a_player_can_play

  end

  def test_a_player_can_input_incorrect_coordinates

  end

  def test_invalid_inputs_quits_game

  end

  def test_start_game_returns_empty_board

  end

  def test_player_is_asked_to_reinput_coordinates_if_invalid_for_first_coordinates

  end

  def test_that_no_ships_are_added_if_invalid_entry_for_first_coordinate

  end

  def test_that_ship_is_added_to_board_if_player_inputs_valid_entry_for_first_coordinate

  end

  def test_player_is_asked_to_reinput_entry_if_invalid_for_second_coordinate

  end

  def test_that_no_ships_are_added_if_invalid_entry_for_second_coordinate

  end

  def test_that_ship_is_added_to_board_if_player_inputs_valid_entry_for_second_coordinate

  end

  def test_computer_places_2_ships_on_computer_board

  end

  def test_random_placement_only_returns_a_valid_placement

  end
end
