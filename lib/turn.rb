require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/play'

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
end
