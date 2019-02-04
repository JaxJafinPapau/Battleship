require 'pry'
require './lib/turn'
require './lib/cell'
require './lib/ship'
require './lib/board'

class Turn < Minitest::Test

  def setup
    @turn = Turn.new
  end

  def test_it_exists

    assert_instance_of turn, Turn
  end

end
