require './lib/cell.rb'
require './lib/ship.rb'
require './lib/board.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @skiff = Ship.new("Skiff", 1)
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_16_cells
    assert_equal 16, @board.cells.keys.count
  end

  def test_board_validates_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A5")
  end

  def test_columns_sorts_by_column
    columns = ["A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2", "A3", "B3", "C3", "D3", "A4", "B4", "C4", "D4"]

    assert_equal columns, @board.columns
  end

  def test_column_neighbors_gives_neighbors
    column_neighbors = [["A1", "B1"], ["B1", "C1"], ["C1", "D1"], ["D1", "A2"], ["A2", "B2"], ["B2", "C2"], ["C2", "D2"], ["D2", "A3"], ["A3", "B3"], ["B3", "C3"], ["C3", "D3"], ["D3", "A4"], ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]

    assert_equal column_neighbors, @board.column_neighbors
  end

  def test_row_neighbors_gives_neighbors
    row_neighbors = [["A1", "A2"], ["A2", "A3"], ["A3", "A4"], ["A4", "B1"], ["B1", "B2"], ["B2", "B3"], ["B3", "B4"], ["B4", "C1"], ["C1", "C2"], ["C2", "C3"], ["C3", "C4"], ["C4", "D1"], ["D1", "D2"], ["D2", "D3"], ["D3", "D4"]]

    assert_equal row_neighbors, @board.row_neighbors
  end

  def test_ship_paired_coordinates_gives_correct_pairs
    assert_equal [["A1", "A2"], ["A2", "A3"]],
    @board.ship_paired_coordinates(@cruiser, ["A1", "A2", "A3"])
  end

  def test_does_ship_coordinate_letters_give_correct_letters
    assert_equal ["A"], @board.ship_coordinate_letters(@cruiser, ["A1", "A2", "A3"])
    assert_equal ["A", "B"], @board.ship_coordinate_letters(@submarine, ["A1", "B1"])
  end

  def test_ship_coordinate_numbers_gives_correct_numbers
    assert_equal ["1", "2", "3"], @board.ship_coordinate_numbers(@cruiser, ["A1", "A2", "A3"])
    assert_equal ["1"], @board.ship_coordinate_numbers(@submarine, ["A1", "B1"])
  end

  def test_neighbor_comparison_gives_expected_bool
    assert_equal true, @board.neighbor_comparison(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.neighbor_comparison(@submarine, ["A1", "B1"])
    assert_equal false, @board.neighbor_comparison(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.neighbor_comparison(@submarine, ["A1", "B2"])
  end

  def test_board_validates_horizontal_placement
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "B3"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A4", "A5"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A4", "B1"])
  end

  def test_board_validates_vertical_placement
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B2"])
    assert_equal false, @board.valid_placement?(@submarine, ["D3", "E3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A4", "B1"])
  end

  def test_board_can_place_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_4 = @board.cells["B1"]

    assert_equal false, cell_1.empty?
    assert_equal false, cell_2.empty?
    assert_equal false, cell_3.empty?
    assert_equal true, cell_4.empty?
  end

  def test_ships_cannot_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_occupied_coordinates_receives_coordinates
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal [["A1", "A2", "A3"]], @board.occupied_coordinates
  end

  def test_occupied_coordinate_check_gives_expected_bool
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.occupied_coordinate_check?(@submarine, ["A1", "B1"])
    assert_equal true, @board.occupied_coordinate_check?(@submarine, ["D3", "D4"])
  end

  def test_board_renders_blank_board
    sample_board = "  1 2 3 4 \n" +
                   "A . . . . \n" +
                   "B . . . . \n" +
                   "C . . . . \n" +
                   "D . . . . \n"

    assert_equal sample_board, @board.render
  end

  def test_board_renders_ships_with_different_conditions
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["B4", "C4"])
    @board.place(@skiff, ["D1"])
    @board.cells["B4"].fire_upon
    @board.cells["D1"].fire_upon
    sample_board = "  1 2 3 4 \n" +
                   "A S S S . \n" +
                   "B . . . H \n" +
                   "C . . . S \n" +
                   "D X . . . \n"

    assert_equal sample_board, @board.render(true)
  end
end
