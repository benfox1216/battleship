require_relative '../lib/cell'

class Board
  attr_reader :cells, :board

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")}
    @board = ""
  end

  def valid_coordinate?(coordinate)
    return true if @cells.keys.include?(coordinate) == true
    false
  end

  def valid_placement?(ship, coordinates)
    return false if ship.length != coordinates.count

### TEST FOR OVERLAPPING SHIPS ###
    coordinates.each do |coordinate|
      return false if @cells[coordinate] == nil
      return false if @cells[coordinate].ship != nil
    end

    letters = []
    numbers = []

    coordinates.each do |coordinate|
      letters << coordinate[0].split[0].to_s
      numbers << coordinate[1].split[0].to_s
    end

    if check_alphabet(letters, ship) == true && numbers.uniq.length == 1
      true
    elsif check_numbers(numbers, ship) == true && letters.uniq.length == 1
      true
    else
      false
    end
  end

  def check_alphabet(value, ship)
    alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    alphabet_index = alphabet.index(value[0])
    index_to_test = []
    letters_to_test = []

    ship.length.times do
      index_to_test << alphabet_index
      alphabet_index += 1
    end

    index_to_test.each do |letter|
      letters_to_test << alphabet[letter]
    end

    letters_to_test == value
  end

  def check_numbers(value, ship)
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]

    new_value = []

    value.each do |number|
      new_value << number.to_i
    end

    numbers_index = numbers.index(new_value[0])
    index_to_test = []
    numbers_to_test = []

    ship.length.times do
      index_to_test << numbers_index
      numbers_index += 1
    end

    index_to_test.each do |number|
      numbers_to_test << numbers[number]
    end

    numbers_to_test == new_value
  end

  def place(ship, coordinates)

    if valid_placement?(ship, coordinates) == true
      coordinates.each do |coordinate|
        @cells[coordinate].ship = ship
      end
    end
  end

  def render(unhide_ships = false)
    @cells.each do |cell|
      cell[1].show_ships = unhide_ships
    end
    
    @board =
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"

    board
  end
end
