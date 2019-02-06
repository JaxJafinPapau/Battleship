require './cell'
require './ship'
require './board'

class Game
attr_reader :own_board, :enemy_board, :main_menu

  def initialize
    @own_board = Board.new
    @enemy_board = Board.new
  end

  def main_menu
    "Welcome to BATTLESHIP. Enter p to play. Enter q to quit."
  end

  def play_or_quit(play = true)
    answer = gets.chomp
    if answer == "p" && true
      assert_instance_of Turn
    else answer == "q"
      exit
    end
  end

  def game_setup
    @computer.place_ship
    @player.place_ship
  end

  def turns
    @player.display_player_board
    @computer.display_computer_board
    @player.take_shot
    @computer.takes_shot
    @player.own_board(true).render
    @computer.own_board.render
  end

  def end_game
    if @turn.check_end_game == true
      "I win!"
    elsif @turn.check_end_game == false
      "You win!"
    main_menu
  end
end
