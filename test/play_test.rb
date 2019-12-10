require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/play'
require './lib/board'
require './lib/ship'

class PlayTest < Minitest::Test

  def setup
    @game = Play.new
  end

  def test_it_exists
    assert_instance_of Play, @game
  end

  def test_it_has_attributes
    assert_instance_of Board, @game.player_board
    assert_instance_of Board, @game.computer_board
    refute_equal @game.player_board, @game.computer_board
  end

  def test_start_game_returns_empty_board
    empty_board =
    "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"

    assert_equal @game.start_game, empty_board
  end

  def test_that_ship_is_added_to_board_if_player_inputs_valid_entry_for_first_coordinate
    @game.enter_first_coordinates
    players_board = @game.player_board.render(true)
    assert_equal 3, players_board.count("S")
  end

  def test_that_ship_is_added_to_board_if_player_inputs_valid_entry_for_second_coordinate
    @game.enter_second_coordinates
    players_board = @game.player_board.render(true)
    assert_equal 2, players_board.count("S")
  end

  def test_computer_places_2_ships_on_computer_board
    computer_ships = @game.place_computer_ships
    assert_equal 5, computer_ships.count("S")
  end

  def test_random_placement_only_returns_a_valid_placement
    coordinates = @game.random_placement_generator(3)
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, coordinates.length
    assert_equal true, board.valid_placement?(cruiser, coordinates)
  end
end
