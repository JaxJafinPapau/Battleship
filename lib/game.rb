require './cell'
require './ship'
require './board'

class Game
  attr_reader :welcome

  def initialize(welcome = "Welcome to BATTLESHIP")
    @welcome = "Welcome to BATTLESHIP"
  end

  def main_menu
    puts "Enter p to play. Enter q to quit."
  end

  def play_or_quit
    main_menu
    p = play
    q = quit
    if p assert_instance_of board
    else q assert_instance_of game
    end
  end
end
