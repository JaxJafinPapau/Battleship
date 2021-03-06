require './ship.rb'
require './cell.rb'
require 'pry'

class Board
  attr_reader :cells,
              :occupied_coordinates

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
    "D4" => Cell.new("D4")
  }
  @occupied_coordinates = []
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end
#explain why, not how I did what I did
  def valid_placement?(ship, ship_coordinates)
    ((ship_coordinate_letters(ship, ship_coordinates).count == 1 &&
      neighbor_comparison?(ship, ship_coordinates)) ||
    (ship_coordinate_numbers(ship, ship_coordinates).count == 1 &&
      neighbor_comparison?(ship, ship_coordinates))) &&
      occupied_coordinate_check?(ship, ship_coordinates) == true
  end

  def columns
    columns = @cells.keys.sort do |coord_a, coord_b|
      if coord_a[1] > coord_b[1]
        1
      elsif coord_a[1] < coord_b[1]
        -1
      else
        coord_a <=> coord_b
      end
    end
  end

  def column_neighbors
    column_neighbors = []
    columns.each_cons(2) do |coord|
      column_neighbors << coord
    end
    return column_neighbors
  end

  def row_neighbors
    row_neighbors = []
    @cells.keys.each_cons(2) do |coord|
      row_neighbors << coord
    end
    return row_neighbors
  end

  def ship_paired_coordinates(ship, ship_coordinates)
    ship_paired_coordinates = []
    ship_coordinates.each_cons(2) do |coord|
      ship_paired_coordinates << coord
    end
    return ship_paired_coordinates
  end

  def ship_coordinate_letters(ship, ship_coordinates)
    ship_coordinate_letters = ship_coordinates.map do |coord|
        coord[0].split('')
      end
    ship_coordinate_letters.flatten.uniq
  end

  def ship_coordinate_numbers(ship, ship_coordinates)
    ship_coordinate_numbers = ship_coordinates.map do |coord|
      coord[1].split('')
    end
    ship_coordinate_numbers.flatten.uniq
  end

  def neighbor_comparison?(ship, ship_coordinates)
    horizontal_compare = ship_paired_coordinates(ship, ship_coordinates) - row_neighbors
    vertical_compare = ship_paired_coordinates(ship, ship_coordinates) - column_neighbors
    horizontal_compare == [] || vertical_compare == []
  end

  def place(ship, ship_coordinates)
    ship_coordinates.each do |coord|
      @cells[coord].place_ship(ship)
    end
    @occupied_coordinates << ship_coordinates
  end

  def occupied_coordinate_check?(ship, ship_coordinates)
    proposed_coordinates = ship_coordinates + @occupied_coordinates.flatten
    proposed_coordinates.count == proposed_coordinates.uniq.count
  end

  def render(arg = false)
    if arg == false
      board = "  1 2 3 4\n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}\n"
      puts board
    else arg == true
      board = "  1 2 3 4\n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}\n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}\n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}\n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}\n"
      puts board
    end
    board
  end
end
