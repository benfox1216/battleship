require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/play'

class Turn
  attr_reader :computer_shots_taken, :player_shots_taken

  def initialize
    @computer_shots_taken = []
    @player_shots_taken = []
  end

  def render(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "\n"

    puts "==============PLAYER BOARD=============="
    player_board.render(true)
    puts "\n"
  end

  def player_take_shot(computer_board)
    puts "Enter a coordinate to take your shot"
    print "> "
    
    shot = ""
    
    loop do
      shot = gets.chomp
      
      shot_validation = computer_board.cells.find do |cell|
        require "pry"; binding.pry
        cell[1].coordinate == shot
      end
      
      break if @player_shots_taken.include?(shot) == false
    end
    
    @player_shots_taken << shot
  end

  def computer_take_shot(player_board)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    shot = ""

    loop do
      shot = possibilities.sample
      break if @computer_shots_taken.include?(shot) == false
    end

    @computer_shots_taken << shot

    player_board.cells[shot].fired_upon = true

    if player_board.cells[shot].render == "M"
      puts "Computer shot on #{shot} missed!\n\n"
    else
      puts "Computer shot on #{shot} hit!\n\n"
    end

    player_board.render(true)
    puts "\n"
  end
end
