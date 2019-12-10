require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/play'

class Turn
  attr_reader :computer_shots_taken

  def initialize
    @computer_shots_taken = []
  end

  def render(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "\n"

    puts "==============PLAYER BOARD=============="
    player_board.render(true)
    puts "\n"
  end

  # def player_take_shot
  #   shot_validation = player_board.cells.find do |cell|
  #     cell[1].coordinate == shot
  #   end
  # end

  def computer_take_shot(player_board)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    begin
      shot = possibilities.sample
    rescue
      retry if @computer_shots_taken.include?(shot)
    end

    @computer_shots_taken << shot
require "pry"; binding.pry
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
