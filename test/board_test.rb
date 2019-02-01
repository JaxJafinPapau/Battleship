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

  def test_does_columns_sort_by_column
    columns = ["A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2", "A3", "B3", "C3", "D3", "A4", "B4", "C4", "D4"]

    assert_equal columns, @board.columns
  end

  def test_does_column_neighbors_give_neighbors
    column_neighbors = [["A1", "B1"], ["B1", "C1"], ["C1", "D1"], ["D1", "A2"], ["A2", "B2"], ["B2", "C2"], ["C2", "D2"], ["D2", "A3"], ["A3", "B3"], ["B3", "C3"], ["C3", "D3"], ["D3", "A4"], ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]

    assert_equal column_neighbors, @board.column_neighbors
  end

  def test_does_row_neighbors_give_neighbors
    row_neighbors = [["A1", "A2"], ["A2", "A3"], ["A3", "A4"], ["A4", "B1"], ["B1", "B2"], ["B2", "B3"], ["B3", "B4"], ["B4", "C1"], ["C1", "C2"], ["C2", "C3"], ["C3", "C4"], ["C4", "D1"], ["D1", "D2"], ["D2", "D3"], ["D3", "D4"]]

    assert_equal row_neighbors, @board.row_neighbors
  end

  def test_does_ship_paired_coordinates_give_proper_pairs?
    assert_equal [["A1", "A2"], ["A2", "A3"]],
    @board.ship_paired_coordinates(@cruiser, ["A1", "A2", "A3"])
  end

  def test_does_ship_coordinate_letters_give_letters

    assert_equal ["A"], @board.ship_coordinate_letters(@cruiser, ["A1", "A2", "A3"])
    assert_equal ["A", "B", "C"], @board.ship_coordinate_letters(@cruiser, ["A1", "B1", "C1"])
  end

  def test_does_board_validate_horizontal_placement
    skip
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "B1"])
  end

  def test_does_board_validate_vertical_placement
    skip
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end
end
