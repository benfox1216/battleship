require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/turn'

class Play
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @turn = Turn.new
  end

  def start_game
    puts  "\nWelcome to BATTLESHIP\n" +
    "Enter p to play. Enter q to quit."

    print "> "
    play_or_quit = gets.chomp

    exit(true) if play_or_quit != "p"

    puts "\nLet's play!\n\n"

    puts "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long.\n\n"

    @player_board.render
  end

  def enter_first_coordinates
    puts "Enter the coordinates for the Cruiser (3 spaces):"
    print "> "

    enter_first_coordinates = gets.chomp
    split_first_coordinates = enter_first_coordinates.tr(",.;:/'", " ").split

    if @player_board.valid_placement?(@player_cruiser, split_first_coordinates) == false
      puts "Those are invalid coordinates. Please try again:\n"
      enter_first_coordinates
    else
      @player_board.place(@player_cruiser, split_first_coordinates)
      puts "\n"
      @player_board.render(true)
    end
  end

  def enter_second_coordinates
    puts "Enter the coordinates for the Submarine (2 spaces):"
    print "> "

    enter_second_coordinates = gets.chomp
    split_second_coordinates = enter_second_coordinates.tr(",.;:/'", " ").split

    if @player_board.valid_placement?(@player_submarine, split_second_coordinates) == false
      puts "Those are invalid coordinates. Please try again:\n"
      enter_second_coordinates
    else
      @player_board.place(@player_submarine, split_second_coordinates)
      puts "\n"
    end
  end

  def place_computer_ships
    begin
      computer_input = computer_place_cruiser(3)

      until @computer_board.valid_placement?(@computer_cruiser, computer_input) == true
        redo
      end
    end
  end

  def random_placement_generator(length)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    final_coordinates = []

    length.times do
      final_coordinates << possibilites.sample
    end

    final_coordinates
  end

  def take_turn
    @turn.render
  end
end
