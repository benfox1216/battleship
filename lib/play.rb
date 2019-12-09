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
      computer_input = random_placement_generator(3)

      until @computer_board.valid_placement?(@computer_cruiser, computer_input)
        redo
      end
    end
  end

  def random_placement_generator(length)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "D1", "D2"]
    
    first_coordinate = []
    first_coordinate << possibilities.sample
    
    first_coordinate_num = first_coordinate[0].split(//)[1].to_i
    first_coordinate_letter = first_coordinate[0].split(//)[0]
    
    if (first_coordinate_num == 1 || first_coordinate_num == 2) && (first_coordinate_letter.bytes[0] == 65 || first_coordinate_letter.bytes[0] == 66)
      directional = ["down", "right"].sample
    elsif first_coordinate_num == 3 || first_coordinate_num == 4
      directional = "down"
    elsif first_coordinate_letter.bytes[0] == 67 || first_coordinate_letter.bytes[0] == 68
      directional = "right"
    end
    
    final_coordinates = []
    
    if directional == "right"
      length.times do
        final_coordinates << first_coordinate_num
        first_coordinate_num += 1
      end
      
      final_coordinates = final_coordinates.map do |coordinate|
        first_coordinate_letter + coordinate.to_s
      end

    end
    
    ### A1, A2, A3
    ### C3, C4
require "pry"; binding.pry
    final_coordinates
  end

  def take_turn
    @turn.render
  end
end
