require 'pry'
require './board'
require './cell'
require './ship'

class Player
  attr_reader :own_board,
              :enemy_board,
              :cruiser,
              :submarine

  def initialize(own_board, enemy_board)
    @own_board = own_board
    @enemy_board = enemy_board
    @player_shots_taken = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def display_player_board
    p "==============PLAYER BOARD=============="
    @own_board.render(true)
  end

  def place_ships
    puts "I have laid out my ships on the grid, you now need to lay out your two ships.\n"
    puts "The Cruiser is three units long and the Submarine is two units long.\n"
    puts "Please enter your coordinates in alphabetical or ascending number order.\n"
    puts "Separate your coordinates with a space. Enter no other characters.\n"
    puts "E.g. A1 A2 A3 or B1 C1 D1\n"
    puts "  1 2 3 4\n"
    puts "A . . . .\n"
    puts "B . . . .\n"
    puts "C . . . .\n"
    puts "D . . . .\n"
    puts "Enter the squares for the Cruiser (3 spaces):"

    cruiser_coordinates = gets.chomp.upcase

    if @own_board.valid_placement?(@cruiser, cruiser_coordinates.split(" "))
      own_board.place(@cruiser, cruiser_coordinates.split(" "))
    else
      until @own_board.valid_placement?(@cruiser, cruiser_coordinates.split(" ")) == true
        p "Sorry, those are not valid coordinates. Please try again"
        cruiser_coordinates = gets.chomp.upcase
      end
    end

    p "Enter the squares for the Submarine (2 spaces)"

    submarine_coordinates = gets.chomp.upcase

    if @own_board.valid_placement?(@submarine, submarine_coordinates.split(" "))
      own_board.place(@submarine, submarine_coordinates.split(" "))
    else
      until @own_board.valid_placement?(@submarine, submarine_coordinates.split(" ")) == true
        p "Sorry, those are not valid coordinates. Please try again"
        submarine_coordinates = gets.chomp.upcase
      end
    end
  end

  def take_shot
    p "Where would you like to shoot?"
    shot = gets.chomp.upcase
    if @enemy_board.valid_coordinate?(shot) && (@player_shots_taken.include?(shot) == false)
      @enemy_board.cells[shot].fire_upon
    else
      until @enemy_board.valid_coordinate?(shot) && (@player_shots_taken.include?(shot) == false)
        if (@enemy_board.valid_coordinate?(shot) == false) && (@player_shots_taken.include?(shot) == false)
          p "Sorry, that's not a valid coordinate. Please try again."
          shot = gets.chomp.upcase
        elsif (@enemy_board.valid_coordinate?(shot) == true) && (@player_shots_taken.include?(shot) == true)
          p "Sorry, you've already fired there!"
          shot = gets.chomp.upcase
        end
      end
      @enemy_board.cells[shot].fire_upon
    end
  end
end
