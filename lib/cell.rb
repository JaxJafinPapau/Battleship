#require 'pry'; binding.pry
require './lib/ship'

class Cell
attr_reader :coordinate, :ship
# @coordinate = [l, n]

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship_type)
    @ship = ship_type
  end
end
