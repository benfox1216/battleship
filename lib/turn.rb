require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/play'

class Turn
  def render(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "\n"

    puts "==============PLAYER BOARD=============="
    player_board.render(true)
    puts "\n"
  end

  def player_take_shot(computer_board)
    shot = ""

    loop do
      puts "Enter a valid coordinate to take your shot:"
      print "> "

      shot = gets.chomp
      exit(true) if shot == "q"

      shot_validation = computer_board.cells.find do |cell|
        cell[1].coordinate == shot
      end

      break if computer_board.cells[shot].fired_upon == false && shot_validation != nil

      puts "\n"
      puts "Those are invalid coordinates. Please try again:\n"
    end

    computer_board.cells[shot].fired_upon = true

    if computer_board.cells[shot].render == "M"
      puts "Your shot on #{shot} missed!\n\n"
    else
      puts "Your shot on #{shot} hit!\n\n"
    end
  end

  def computer_take_shot(player_board)
    possibilities = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    shot = ""

    loop do
      shot = possibilities.sample
      break if player_board.cells[shot].fired_upon == false
    end

    player_board.cells[shot].fired_upon = true

    if player_board.cells[shot].render == "M"
      puts "Computer shot on #{shot} missed!\n\n"
    else
      puts "Computer shot on #{shot} hit!\n\n"
    end
  end
end
