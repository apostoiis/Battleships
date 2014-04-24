require_relative 'ship'
require_relative 'water'
require_relative 'content'

class Board

	attr_reader :grid

	include ShipRandomizer

	def initialize(player)
		@opponent_grid
		@grid = {}
		('A'..'J').to_a.each { |letter| 1.upto(10) { |number| @grid["#{letter}#{number}"] = Content.new(Water.new) }}
		@player = player
	end

	def owner
		@player.name
	end

	def assign_ships
		('A'..'D').to_a.each { |letter| @grid["#{letter}1"] = Ship.new }
	end

	def replace_symbol(x)
		return '' if x == 's'
		x
  end

	def opponent_view
		@opponent_grid = @grid.values.map { |value| replace_symbol(value.content.to_s) }.each_slice(10).to_a.transpose
	end
	
	def rows
		@grid.values.map{|value| value.content.to_s}.each_slice(10).to_a.transpose
	end

	def grid_view_keys
		@grid.keys.each_slice(10).to_a.transpose.map {|slice| puts slice.inspect}
	end

	def grid_view_values
		@grid.values.map{|value| value.content.to_s}.each_slice(10).to_a.transpose.map {|slice| puts slice.inspect}	
	end

	def register_shot(coordinates)
		@grid[coordinates].content.hit!
	end

end
