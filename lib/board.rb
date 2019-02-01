require './lib/ship.rb'
require './lib/cell.rb'
require 'pry'

class Board
  attr_reader :cells

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
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, ship_coordinates)
    # @cells.keys.include?(ship_coordinates)
    # coordinate_list = @cells.keys


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

    # paired_horizontal_neighbors = []
    # coordinate_list.each_cons(2) do |coord|
    #   paired_horizontal_neighbors << coord
    # end
    #
    # ship_paired_coordinates = []
    # ship_coordinates.each_cons(2) do |coord|
    #   ship_paired_coordinates << coord
    # end
    #
    # ship_coord_letters = ship_coordinates.map do |coord|
    #   coord[0].split('')
    # end
    #
    # ship_coord_numbers = ship_coordinates.map do |coord|
    #   coord[1].split('')
    # end
    #
    # (ship_coord_letters.flatten.uniq.count == 1 || ship_coord_numbers.flatten.uniq.count == 1) &&
    #   ship_paired_coordinates - paired_horizontal_neighbors == []
      #binding.pry
  end

end
