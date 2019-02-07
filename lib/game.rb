require './cell'
require './ship'
require './board'
require './player'
require './computer'
require 'pry'

class Game
  attr_reader :player_board,
              :computer_board,
              :player,
              :computer
  attr_accessor :winner


# attr_reader :own_board, :enemy_board, :main_menu

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player = Player.new(@player_board, @computer_board)
    @computer = Computer.new(@computer_board, @player_board)
    @winner = "nobody"
  end

  def main_menu
    p "Welcome to BATTLESHIP. Enter p to play. Enter q to quit."
    answer = gets.chomp
    if answer == "p"
      game_setup
    else answer == "q"
      exit
    end
  end

  # def play_or_quit(play = true)
  #   answer = gets.chomp
  #   if answer == "p" && true
  #     assert_instance_of Turn
  #   else answer == "q"
  #     exit
  #   end
  #end


  def game_setup
    # @computer.place_ship
    # @player.place_ship
    @computer.computer_place_ship(@computer.cruiser)
    @computer.computer_place_ship(@computer.submarine)
    @player.place_ships
    turn
  end

  def turn
    @player.display_player_board
    @computer.display_computer_board
    @player.take_shot
    @computer.computer_takes_shot
    check_end_of_game
  end

  def check_end_of_game
    if @player.own_board.render(true).include?("S") == false
      @winner = "computer"
      end_game
    elsif @computer.own_board.render(true).include?("S") == false
      @winner = "player"
      end_game
    else
      turn
    end
  end

  # def end_game
  #   if @turn.check_end_game == true
  #     "I win!"
  #   elsif @turn.check_end_game == false
  #     "You win!"
  #   end
  #   main_menu
  # end

  def end_game
    if @winner = "computer"
      p "Game over, I win! Better luck next time."
      main_menu
    else @winner = "player"
      p "Game over, you win! I'll have to guess a little smarter next time."
      main_menu
    end
  end
end
