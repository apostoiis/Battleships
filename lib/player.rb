require 'board'

class Player

# include Board

attr_reader :board

def initialize(name)
@name=name
@board = Board.new(name)
end


def has_ships_still_floating?
	board.rows.flatten.include?("s")
end

def shoot(coordinates,opponent_board)

end


end