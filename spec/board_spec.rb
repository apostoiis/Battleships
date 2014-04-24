require 'board'

describe Board do
	
	let(:water)  { double :water }
	let(:board)  { Board.new   }
	let(:ship)  { double :ship }

	context "Initial conditions" do
		it 'opponent_view contents should be all water' do
			expected = board.opponent_view.flatten.inject(0) {|acc,obj| acc + obj.class }
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




