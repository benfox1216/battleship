require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/play'

class Turn

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def render(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "\n"
    
    puts "==============PLAYER BOARD=============="
    player_board.render(true)
    puts "\n"
  end
  
  def computer_take_shot(player_board)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    shot = possibilities.sample
    
    shot_validation = player_board.cells.find do |cell|
      cell[1].coordinate == shot
    end
    
    @player_board = player_board
    @player_board.cells[shot].fired_upon = true
    
    if @player_board.cells[shot].render == "M"
      puts "My shot on A4 missed!\n\n"
    else
      puts "My shot on A4 hit!\n\n"
    end
    
    @player_board.render
    puts "\n"
  end
end
