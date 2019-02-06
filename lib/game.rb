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

  def setup_game_instructions
         "Ships must reside either on one row or one column. \n"
         "No diagonals and no skipping spaces, please! \n"
         "Please choose your coordinates in ascending number or \n"
         "alphabetical order with spaces between coordinates. \n"
         "Where would you like to place your cruiser? (3 Spaces)"
  end

  def setup_game
    cruiser_placement = gets.chomp
  end
end
