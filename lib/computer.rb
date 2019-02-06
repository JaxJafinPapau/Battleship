require 'pry'
require './lib/turn'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class Computer
  attr_reader :own_board,
              :enemy_board,
              :computer_shots_taken,
              :cruiser,
              :submarine

  def initialize(own_board, enemy_board)
    @own_board = own_board
    @enemy_board = enemy_board
    @computer_shots_taken = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def display_computer_board
    @own_board.render
  end

  def computer_place_ship(ship)
    placement = []
    until @own_board.valid_placement?(ship, placement) == true
      placement = @own_board.cells.keys.sample(ship.length)
    end
    @own_board.place(ship, placement)
  end

  def computer_takes_shot
    possible_shots = @enemy_board.cells.keys - @computer_shots_taken
    comp_shot = possible_shots.sample
    @computer_shots_taken << comp_shot
    @enemy_board.cells[comp_shot].fire_upon
    return comp_shot
  end
end
