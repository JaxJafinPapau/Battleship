require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/player'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_player_
    
  end



end
