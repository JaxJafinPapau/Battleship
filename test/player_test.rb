require 'pry'
require './lib/turn'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/computer'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test

  def setup
    @own_board = Board.new
    @enemy_board = Board.new
    @player = Player.new(@own_board, @enemy_board)
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_display_player_board
    @player.own_board.place(@cruiser, ["A1", "A2", "A3"])
    @player.own_board.place(@submarine, ["B4", "C4"])

    sample_board = "==============PLAYER BOARD=============="
                   "  1 2 3 4 \n" +
                   "A S S S . \n" +
                   "B . . . S \n" +
                   "C . . . S \n" +
                   "D . . . . \n"
    assert_equal sample_board, @player.display_player_board
  end
end
