require_relative './lib/play'

play = Play.new

play.start_game
play.enter_first_coordinates
play.enter_second_coordinates
play.place_computer_ships
play.take_turn