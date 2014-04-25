module CheckCells

	def letter_offset(letter, length)
		ascii = (letter.ord)+length
		ascii.chr
	end
	
	def min_letter(letter)
		return 'A' if letter.ord < 'A'.ord
		letter
	end

	def max_letter(letter)
		return 'J' if letter.ord > 'J'.ord
		letter
	end

	def letterRange(letter, length, direction, offset)
		first_letter = letter_offset(letter, -offset)
		first_letter = min_letter(first_letter)

		if direction =='D'
			last_letter = letter_offset(letter, +offset)	
		elsif direction =='R'
			last_letter = letter_offset(letter, length)
		end
		last_letter = max_letter(last_letter)

		(first_letter..last_letter)
	end

	def numberRange(number, length, direction, offset)
		first_number = number-offset
		first_number = 1 if first_number < 1
		if direction =='D'
			last_number = number+length-1+offset
		elsif direction =='R'
			last_number = number+offset
		end
		last_number = 10 if last_number > 10
		(first_number..last_number)
	end

	def coords_split(coords)
		[coords.chars.first, coords[1..-1].to_i]
	end

	def range(coords, length, direction, offset)
		letter, number = coords_split(coords)
		letter_range = letterRange(letter, length, direction, offset)
		number_range = numberRange(number, length, direction, offset)
		[letter_range.to_a, number_range.to_a]
	end

	def cartesian_product(letters, numbers)
		results=[]
		letters.each do |letter|
			numbers.each do |number|
				results << (letter+number.to_s)
			end
		end
		results
	end

	def cellsRange(coords, length, direction, offset=0)
		letter_range, number_range = range(coords, length, direction, offset)
		cartesian_product(letter_range, number_range)
	end
end


# class Check; include CheckCells; end

# check = Check.new
# puts check.cellsRange("A5",3,"R").inspect


