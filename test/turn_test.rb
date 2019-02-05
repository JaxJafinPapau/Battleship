require 'pry'
require './lib/turn'
require './lib/cell'
require './lib/ship'
require './lib/board'
require 'Minitest/autorun'
require 'Minitest/pride'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_displays_own_board
    @turn.own_board.place(@cruiser, ["A1", "A2", "A3"])
    @turn.own_board.place(@submarine, ["B4", "C4"])

    sample_board = "  1 2 3 4 \n" +
                   "A S S S . \n" +
                   "B . . . S \n" +
                   "C . . . S \n" +
                   "D . . . . \n"

    assert_equal sample_board, @turn.display_own_board
  end

  def test_turn_displays_opponent_board
    @turn.opponent_board.place(@cruiser, ["D1", "D2", "D3"])
    @turn.opponent_board.place(@submarine, ["A4", "B4"])

    sample_board = "  1 2 3 4 \n" +
                   "A . . . . \n" +
                   "B . . . . \n" +
                   "C . . . . \n" +
                   "D . . . . \n"

    assert_equal sample_board, @turn.display_opponent_board
  end

  def test_turn_takes_shot
    @turn.opponent_board.place(@cruiser, ["D1", "D2", "D3"])
    @turn.take_shot("B1")
    @turn.take_shot("D1")

    sample_board = "  1 2 3 4 \n" +
                   "A . . . . \n" +
                   "B M . . . \n" +
                   "C . . . . \n" +
                   "D H . . . \n"

    assert_equal sample_board, @turn.display_opponent_board
  end

  def test_turn_gives_feedback
    @turn.opponent_board.place(@cruiser, ["D1", "D2", "D3"])
    @turn.take_shot("D1")
    expect_hit = @turn.give_feedback("D1")
    @turn.take_shot("B1")
    expect_miss = @turn.give_feedback("B1")

    assert_equal "Hit!", expect_hit
    assert_equal "Miss!", expect_miss
  end
end
