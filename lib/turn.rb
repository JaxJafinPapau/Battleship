class Turn
  attr_reader :own_board,
              :opponent_board,
              :comp_taken_shots

  def initialize

    @opponent_board = Board.new
    @comp_taken_shots = []
  end

  def display_own_board
    @own_board.render(true)
  end

  def display_opponent_board
    @opponent_board.render
  end

  def take_shot(coordinate)
    @opponent_board.cells[coordinate].fire_upon
    @shots_take << coordinate
  end

  def validate_shot(coordinate)
    if @user_shots_taken.include?(coordinate)
      puts "Sorry, you've already shot there!"
  	return false
    elsif @turn.opponent_board.validate_coordinate?(coordinate) == false
      puts "Sorry, that's not a valid coordinate."
  	return false
    else
      true
    end
  end

  def computer_takes_shot
    possible_shots = @own_board.cells.keys - @comp_taken_shots
    comp_shot = possible_shots.sample
    @comp_taken_shots << comp_shot
    @own_board.cells[comp_shot].fire_upon
    return comp_shot
  end

  def give_feedback(coordinate)
    if @opponent_board.cells[coordinate].render == "M"
      p "Miss!"
    elsif @opponent_board.cells[coordinate].render == "H"
      p "Hit!"
    else @opponent_board.cells[coordinate].render == "X"
      p "You sunk my #{@opponent_board.cells[coordinate].ship.name}!"
    end
  end
end
