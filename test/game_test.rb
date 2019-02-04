require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
#require './lib/cell'
#require './lib/ship'
#require './lib/board'
require './lib/game'

class Game < Minitest::Test

  def setup
    @game = Game.new(welcome)
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_it_has_a_menu
    skip

    assert_equal "Enter p to play. Enter q to quit.", @game.main_menu
  end

#  def test_player_input
#
#    assert_equal , @game.play_or_quit
#  end

  def test_computer_place_ships
    skip
  end

  def test_player_place_ships
    skip
  end
end
