require './lib/board'

class Turn

  def initialize
    @board = Board.new
  end

  def render
    puts "=============COMPUTER BOARD============="
    @board.render
    puts "==============PLAYER BOARD=============="
    @board.render(true)
  end

  def place_ships(*user_input)
    user_input = gets.chomp

  end
end
