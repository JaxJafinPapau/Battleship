#require './cell'
#require './ship'
#require './board'

class Game
  attr_reader :welcome

  def initialize(welcome)
    @welcome = "Welcome to BATTLESHIP. Enter p to play. Enter q to quit."
  end

  def game_ends
    @ship.sunk? == true
    assert_instance_of Game
  end
end
