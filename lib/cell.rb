require 'pry'
require './lib/ship'

class Cell
attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @empty = true
  end

  def fired_upon?
    @fired_upon
  end

  def empty?
    @empty
  end

  def place_ship(ship_type)
    @ship = ship_type
    @empty = false
  end

  def fire_upon
    @fired_upon = true
    if @empty == false
      @ship.hit
    end
  end

  def render(arg = false)
    if empty? && fired_upon?
      return "M"
    elsif empty? && !fired_upon?
      return "."
    elsif !empty? && !fired_upon? && arg == true
      return "S"
    elsif !empty? && fired_upon? && @ship.sunk? == false
      return "H"
    elsif !empty? && fired_upon? && @ship.sunk? == true
      return "X"
    end
  end
end
