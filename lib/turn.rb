require './lib/board'
require './lib/ship'

class Turn

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @player_board = Board.new
    @computer_board = Board.new
  end

  def render
    puts "=============COMPUTER BOARD============="
    @computer_board.render
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)
  end

  def place_ships(*user_input)
    cruiser_placement = gets.chomp
    submarine_placement = gets.chomp

    if @board.valid_placement?(@cruiser, cruiser_placement)
      @player_board.place(@cruiser, cruiser_placement)
    end
    if @board.valid_placement?(@sumbarine)
      @player_board.place(@submarine, submarine_placement)
    end


  end

  def random_placement_generator(length)
    # is it going to be horizontal or vertical?
    possabilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    direction_possabilities = [false, true]
    starting_point = possabilities.sample
    direction = direction_possabilities.sample

    if direction

    # choose random start
    # increment from there
  end
end
