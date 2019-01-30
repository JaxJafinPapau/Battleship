require './lib/cell.rb'
require './lib/ship.rb'
require './lib/board.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_16_cells
    assert_equal 16, @board.cells.keys.count
  end

  def test_does_board_validate_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A5")
  end
end