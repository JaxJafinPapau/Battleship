class Turn
  attr_reader :own_board,
              :opponent_board

  def initialize
    @own_board = Board.new
    @opponent_board = Board.new
  end


  def display_own_board
    @own_board.render(true)
  end

  def display_opponent_board
    @opponent_board.render
  end

  def take_shot(coordinate)
    @opponent_board.cells[coordinate].fire_upon
  end

  def give_feedback(coordinate)
    if @opponent_board.cells[coordinate].render == "M"
      return "Miss!"
    elsif @opponent_board.cells[coordinate].render == "H"
      return "Hit!"
    else @opponent_board.cells[coordinate].render == "X"
      return "Sunk!"
    end
  end
end
