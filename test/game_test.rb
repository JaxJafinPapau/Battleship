require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new("Welcome to BATTLESHIP. Enter p to play. Enter q to quit.")
    @cell = Cell.new("B4")
    @board = Board.new
    @ship = Ship.new()
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_returns_to_main_menu_at_end
    @game
    @game
    assert_equal , @game.game_ends
  end

#  def test_player_input
#

#  end

  #def test_computer_place_ships
  #  skip
  #end

  #def test_player_place_ships
  #  skip
  #end
end
