class Turn
  attr_reader


  def give_feedback(coordinate)
    if @opponent_board.cells[coordinate].render == "M"
      p "Miss!"
    elsif @opponent_board.cells[coordinate].render == "H"
      p "Hit!"
    else @opponent_board.cells[coordinate].render == "X"
      p "You sunk my #{@opponent_board.cells[coordinate].ship.name}!"
    end
  end

  def check_end_game(player_board, computer_board)
    if @player.own_board.render.include?("S") == false
      puts "Game over, I win! Better luck next time."
    elsif @computer.own_board.render(true).include?("S") == false
      puts "Game over, you win! I'll have to guess a little smarter next time."
    else
      nil
    end
  end
end
  # def initialize
  # end

  # def display_player_board
  #   @own_board.render(true)
  # end
  #
  # def display_opponent_board
  #   @opponent_board.render
  # end
  #
  # def take_shot(coordinate)
  #   @opponent_board.cells[coordinate].fire_upon
  #   @shots_take << coordinate
  # end
  #
  # def validate_shot(coordinate)
  #   if @user_shots_taken.include?(coordinate)
  #     puts "Sorry, you've already shot there!"
  # 	return false
  #   elsif @turn.opponent_board.validate_coordinate?(coordinate) == false
  #     puts "Sorry, that's not a valid coordinate."
  # 	return false
  #   else
  #     true
  #   end
  # end
