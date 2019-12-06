require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'

puts  "\nWelcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."

print "> "
play_or_quit = gets.chomp

exit(true) if play_or_quit != "p"

puts "\nLet's play!\n\n"

puts "I have laid out my ships on the grid.\n" +
"You now need to lay out your two ships.\n" +
"The Cruiser is three units long and the Submarine is two units long.\n\n"

puts " 1 2 3 4\n" +
"A . . . .\n" +
"B . . . .\n" +
"C . . . .\n" +
"D . . . .\n\n"

puts "Enter the coordinates for the Cruiser (3 spaces):"
puts "(Separate each by a comma or a space)"
print "> "

enter_coordinates = gets.chomp
split_coordinates = enter_coordinates.tr(",.;:/'", " ").split

require "pry"; binding.pry