require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
#require 'pry';  binding.pry

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("cruiser", 3)
  end

  def test_it_exists

    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate

    assert_equal "B4", @cell.coordinate
  end

  def test_is_cell_empty

    assert_equal true, @cell.empty?
  end

  def test_place_ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end
end
