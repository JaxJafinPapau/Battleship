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

  def test_did_it_hit

    assert_equal false, @cell.fired_upon
  end

  def test_fire_on_ship
    @cell.fire_upon
    assert_nil @ship, @cell.fire_upon
  end

  def test_did_health_decrease
    @cell.place_ship(@cruiser)
    @cruiser.hit
    assert_equal 2, @cell.ship.health
  end

  def test_has_cell_been_fired_on
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
  end

  #def test_fire_upon
    #cell_1 = Cell.new("B4")

    #assert_equal , 
end
