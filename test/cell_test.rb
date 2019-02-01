require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require 'pry'

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

  def test_that_not_fired_upon_when_initialized

    assert_equal false, @cell.fired_upon?
  end

  def test_fire_on_ship
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
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

  def test_fire_upon_opponent
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    assert_equal true, cell_1.fired_upon?
  end

  def test_optional_arg
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(@cruiser)

    assert_equal "S", cell_2.render(true)
  end

  def test_did_you_hit
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(@cruiser)
    cell_2.fire_upon

    assert_equal "H", cell_2.render
  end

  def test_did_you_miss
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.fire_upon

    assert_equal "M", cell_2.render
  end

  def test_did_ship_sink
    cell_2 = Cell.new("C3")
    cell_2.place_ship(@cruiser)
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert_equal "X", cell_2.render
  end
end
