require_relative 'ship'
require_relative 'check_cells'
require_relative 'content'

module ShipRandomizer

include CheckCells
# ship_length = 6


	def ships
		ship_lengths = [2,3,3,4,5]
		ship_lengths.each {|ship_length|allocate_ship(ship_length)}
	end

	def letter_to_index(letter)
		letters = {"A" => 0, "B" => 1, "C" => 2,"D" => 3,"E" => 4,"F" => 5,"G" => 6,"H" => 7,
			"I" => 8,"J" => 9}
		letters[letter]
	end



	def space_available?(coords, length, direction)
		cells_to_check = cellsRange(coords, length, direction, 0)
		# puts.inspect()
		result = cells_to_check.select do  |key| 
			# check = grid[key]
			# puts check.inspect
			grid[key].content.to_s == 's'
		end
		result = !(result.any?)
	end

	def place_ship(coords, length, direction)
		ship_cells = cellsRange(coords, length, direction, 0)
		ship_cells.each{|key| grid[key].content=Ship.new}
	end

	def allocate_ship(length)
		loop do
			rand()>0.5 ? direction = "R" : direction = "D"
			case direction	
				when "R"
					start_coord = grid_cols.first(10-length+1).flatten.sample
					 if space_available?(start_coord, length, direction)
					 		place_ship(start_coord, length, direction)
							break			
					# row_num = start_coord.chars[1..-1].join.to_i-1
					# specific_row = grid_rows[row_num]
					# start_index = specific_row.index(start_coord)
					# search_array = specific_row[start_index,length]
					
					# if check_array(search_array) 
					# 	search_array
						# break
						else
							next
						end

				when "D"
					start_coord = grid_rows.first(10-length+1).flatten.sample
					 if space_available?(start_coord, length, direction)
					 		place_ship(start_coord, length, direction)
							break	
						else
							next
						end
					# col_letter = start_coord.chars[0]
					# col_num= letter_to_index(col_letter)
					# specific_col = grid_cols[col_num ]
					# start_index = specific_col.index(start_coord)
					# search_array = specific_col[start_index,length]
					 
					# if check_array(search_array) 
					# 	search_array.each {|key| grid[key].content=(Ship.new)}
					# 	break
					# else
					# 	next
					# end

				end
			end
	end


	








end