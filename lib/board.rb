require_relative 'check_cells'
require_relative 'ship_randomizer'
require_relative 'content'
require_relative 'ship'
require_relative 'water'

class Board

	include ShipRandomizer
	include CheckCells

	attr_reader :grid

	def initialize(player)
		@opponent_grid
		@grid = {}
		('A'..'J').to_a.each { |letter| 1.upto(10) { |number| @grid["#{letter}#{number}"] = Content.new(Water.new)}}
		@player = player
		ships
	end


	def reset_ships
		('A'..'J').to_a.each { |letter| 1.upto(10) { |number| @grid["#{letter}#{number}"] = Content.new(Water.new)}}
		ships
		self
	end

	def owner
		@player.name
	end

	def replace_symbol(x)
		return " " if x == 's'
		x
  end

	def opponent_view
		@opponent_grid = @grid.values.map { |value| replace_symbol(value.content.to_s) }.each_slice(10).to_a.transpose
	end
	
	def rows
		@grid.values.each_slice(10).to_a.transpose
	end

	def register_shot(coordinates)
		@grid[coordinates].content.hit!
	end


	def view_grid
		@grid.values.map {|value| value.content.to_s}.each_slice(10).to_a.transpose.map {|row| puts row.inspect}
	end

	def grid_rows
		@grid.keys.each_slice(10).to_a.transpose
	end

	def grid_cols
		@grid.keys.each_slice(10).to_a
	end



end
