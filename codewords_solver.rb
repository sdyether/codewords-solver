class CodewordsSolver

	def initialize( word_data, initial_letters = [], dict )

		@words = word_data
		@letter_map = initial_letters
		@dict = dict
		
	end
	
	def self.valid_data?( data )
		#attempt to detect mispelling of entered word data
		valid = true
		
		data.each do |word|
			word.each do |letter|
				if not letter.between?(1,26)
					puts "incorrectly formed word: " + word.to_s
					valid = false
				end
			end
		end
		valid
	end
	
	def self.word_possibilites( word, letter_map, dict )
	
		current = dict[word.length].dup

		#return all possible words for an unsolved word
		
		word.each_with_index do |wordnum, index|
			puts ((index+1) * 100 / word.length ).round.to_s + "%..."
			if letter_map.key?(wordnum)
				tmp = current.dup
				current.each do |pword|

					if not (pword[index] == letter_map[wordnum].downcase)
						#remove a word as soon as it doesn't have a code letter 
						#in the correct position
						tmp.delete(pword)
					end
				end
				current = tmp.dup
			end
		end
		
		current
	end
	
end
