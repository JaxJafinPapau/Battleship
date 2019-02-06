require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
#require './lib/cell'
#require './lib/ship'
#require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    #@cell = Cell.new("B4")
    #@ship = Ship.new("skiff", 1)
    #@board = Board.new
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_main_menu

    assert_equal "Welcome to BATTLESHIP. Enter p to play. Enter q to quit.", @game.main_menu
  end

  def test_player_wants_to_play
    answer = "p"

    assert_equal "p", @game.play_or_quit(true)
  end

  def test_player_wants_to_quit
    answer = "q"

    assert_equal exit, @game.play_or_quit
  end

  #def test_end_game

  #  assert_equal , @game.end_game
  #end
end
