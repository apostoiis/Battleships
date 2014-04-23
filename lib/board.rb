require_relative 'ship'
require_relative 'water'

class Board
	def initialize(player)
		@opponent_grid
		@grid = {}
		('A'..'J').to_a.each { |letter| 1.upto(10) { |number| @grid["#{letter}#{number}"] = water }}
		@player = player
	end

	def owner
		@player.name
	end

	def assign_ships
		('A'..'D').to_a.each { |letter| @grid["#{letter}1"] = ship }
	end

	def water
		Water.new
	end

	def replace_symbol(x)
		return '' if x == 's'
		x
  end

	def opponent_view
		@opponent_grid = @grid.values.map { |value| replace_symbol(value.to_s) }.each_slice(10).to_a.transpose
	end

	def ship
		Ship.new
	end

	def rows
		@rows ||= @grid
		@rows.values.map { |value| value.to_s }.each_slice(10).to_a.transpose
		# @rows
	end

	def grid_view
		@grid.keys.each_slice(10).to_a.transpose
	end

	def register_shot(coordinates)
		@grid[coordinates].hit!
	end











end
