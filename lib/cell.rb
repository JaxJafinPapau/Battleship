<<<<<<< HEAD
#require 'pry'; binding.pry
=======
require 'pry'
>>>>>>> 61fec93f0a8c86edb4f7fb25a5fcea191d507e2d
require './lib/ship'

class Cell
attr_reader :coordinate, :ship
<<<<<<< HEAD
# @coordinate = [l, n]
=======
>>>>>>> 61fec93f0a8c86edb4f7fb25a5fcea191d507e2d

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
<<<<<<< HEAD
  end

  def empty?
    @ship.nil?
=======
    @fired_upon = false
    @empty = true
  end

  def fired_upon?
    @fired_upon
  end

  def empty?
    @empty
>>>>>>> 61fec93f0a8c86edb4f7fb25a5fcea191d507e2d
  end

  def place_ship(ship_type)
    @ship = ship_type
<<<<<<< HEAD
=======
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
>>>>>>> 61fec93f0a8c86edb4f7fb25a5fcea191d507e2d
  end
end
