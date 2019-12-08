require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'

class PlayGame
  attr_reader :board
  
  def initialize
    @board = Board.new
    @turn = Turn.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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
    
    @board.render
  end
  
  def enter_coordinates
    puts "Enter the coordinates for the Cruiser (3 spaces):"
    puts "(Separate each by a comma or a space)"
    print "> "

    enter_coordinates = gets.chomp
    split_coordinates = enter_coordinates.tr(",.;:/'", " ").split

    if @board.valid_placement?(@cruiser, split_coordinates) == false
      puts "Those are invalid coordinates. Please try again:"
      enter_coordinates
    end
  end
end