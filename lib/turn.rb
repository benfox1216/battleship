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
  
  def computer_take_shot
    
  end
end
