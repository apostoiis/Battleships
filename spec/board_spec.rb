require 'board'

describe Board do
	let(:water)  { double :water }
	let(:board)  { Board.new   }
	let(:ship)  { double :ship }

	context "Initial conditions" do
		it 'opponent_view should be all water' do
			expected = board.opponent_view.flatten.count('')
			expect(expected).to eq 100
		end

		it 'has rows' do
			board.assign_ships
			expected = board.rows.flatten.count('s')
			expect(expected).to eq 4
			# puts board.rows.inspect
		end
	end
end









# class Water
# 	def initialize
# 		@status = ''
# 	end

# 	def to_s
# 		@status
# 	end

# 	def hit!
# 		@status = 'o'
# 	end
# end

# w = Water.new
# w.to_s
# w.hit!


# def shoot_at(coordinates)
# 	@grid[coordinates].hit! if @grid[coordinates].to_s == ''
# end








# class Ship
# 	def initialize
# 		@status = 's'
# 	end

# 	def to_s
# 		@status
# 	end

# 	def hit!
# 		@status = 'x'
# 	end
# end

# ship = Ship.new

# ship.to_s

# ship.hit!

# ship.to_s