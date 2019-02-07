require './game'

class Runner

  new_game = Game.new
  new_game.main_menu
  new_game.game_setup
  new_game.turn
end
