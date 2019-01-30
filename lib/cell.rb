require 'pry'
require './lib/ship'

class Cell
attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship_type)
    @ship = ship_type
  end

  def fire_upon
    @fired_upon == true
    if empty? == false
    end
  end

  def render
    if empty? && fired_upon
      return "M"
    elsif empty? && !fired_upon
      return "."
    else !empty? && fired_upon
      return "H"
      if @ship.health == 0
        return "X"
      end
    end
  end
end
