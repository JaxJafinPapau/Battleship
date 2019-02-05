require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @cell = Cell.new("B4")
    @ship = Ship.new("skiff", 1)
    @board = Board.new
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_main_menu
    @game

    assert_equal "Welcome to BATTLESHIP. Enter p to play. Enter q to quit.", @game.main_menu
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
