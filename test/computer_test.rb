require 'pry'
require './lib/turn'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/computer'
require 'minitest/autorun'
require 'minitest/pride'

class ComputerTest < Minitest::Test
  def setup
    @own_board = Board.new
    @opponent_board = Board.new
    @computer = Computer.new(@own_board, @opponent_board)
  end

  def test_computer_exists
    assert_instance_of Computer, @computer
  end

  def test_computer_displays_own_board
    sample_board = "  1 2 3 4 \n" +
                   "A . . . . \n" +
                   "B . . . . \n" +
                   "C . . . . \n" +
                   "D . . . . \n"
    assert_equal sample_board, @computer.display_computer_board
  end

  def test_computer_places_ships
    @computer.computer_place_ship(@computer.cruiser)
    @computer.computer_place_ship(@computer.submarine)
    sample_board = @computer.own_board.render(true)
    assert_equal true, sample_board.include?("S")
  end

  def test_computer_takes_shot
    sample_board = @computer.enemy_board.render
    test_shot = @computer.computer_takes_shot

    assert_equal @computer.computer_shots_taken[-1], test_shot
  end
end
