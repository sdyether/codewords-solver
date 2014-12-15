class CodewordsSolver

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
	
	def self.valid_state?( words, letter_map, dict )

		words.each do |w|
		
			tmp_word = ""
			w.each do |letter|
				
				if letter_map.key?(letter)
					tmp_word << letter_map[letter].downcase
				else
					#discard incomplete words
					tmp_word = nil
					break
				end
				
			end

			#check each word is valid
			if (tmp_word)
				if not( dict[tmp_word.length].include?(tmp_word) )
					return false
				end
			end
			
		end
		
		return true
	end
	
	def self.solve( words, letter_map, dict )
	#recursive solve method
		
		if valid_state?( words, letter_map, dict )
			if letter_map.length == 26
				puts "Codeword solved!"
				p letter_map
				return true #correct solve!
			end
		else
			puts "return from invalid branch"
			return false #invalid solve
		end
		#not completed yet
		
		seedword = choose_seed( words, letter_map )

		branches = word_possibilites( seedword, letter_map, dict)
		
		p letter_map
		puts "Chosen seedword: " + seedword.to_s
		puts "Branches for seedword: " + branches.to_s
		
		if branches.length == 0
			puts "return from invalid branch"
			return false 
			
		elsif branches.length >= 1

			branches.each do |b|
				new_letter_map = letter_map.dup
				#update letter map and keep going
				seedword.each_with_index do |wordnum, index|
					if not new_letter_map.key?(wordnum)
						new_letter_map[wordnum] = b[index].upcase
					end
				end
				
				#recursively depth first traverse
				result = solve( words, new_letter_map, dict )
				if ((result) or ( b == branches.last ))
					return result
				end
			end
			
		else
			puts "Should not reach here"
			abort
		end
			
	end
	
	def self.choose_seed( words, letter_map )
		#try to find the word most likely to have the least amount of possibilities
		#long words and words partially solved are high weighted
		weights = {}
		words.each do |w|
			counts = 0
			w.each do |letter|
				if letter_map.key?(letter)
					counts += 1
				end
			end
			
			if not (counts == w.length) #don't suggest completed words
				weighting = ((counts.to_f / w.length) * 100).round + 2 * w.length
				weights[w] = weighting #use word as key in hash
			end
		end

		#return highest weighted word as a single array of ints
		return Hash[weights.sort_by{|k, v| v}.reverse].first.first

	end
	
	#TODO this is really slow can we make more efficient?
	def self.word_possibilites( word, letter_map, dict )
	
		current = dict[word.length].dup

		#return all possible words for an unsolved word
		
		word.each_with_index do |wordnum, index|
			#print progress
			print ((index+1) * 100 / word.length ).round.to_s + "%... "
			
			if letter_map.key?(wordnum)
				tmp = current.dup
				current.each do |pword|

					if not (pword[index] == letter_map[wordnum].downcase)
						#remove a word as soon as it doesn't have a code letter 
						#in the correct position
						tmp.delete(pword) #TODO maybe hash this structure for faster delete lookups?
					end
					
				end
				
				current = tmp.dup
			end
			
		end
		#print progress
		print "Done.\n\n"

		#remove words that are invalid
		if not current.empty?
			tmp = current.dup
			tmp.each do |w|
			
				word.each_with_index do |wordnum, index|
					if not letter_map.key?(wordnum)

						if letter_map.has_value?(w[index].upcase)
							current.delete(w)
						end
					end
				end
			end
		end
		
		current
	end
	
	#misc
	def self.get_full_letter_map()
		map = {}
		val = 1
		('A'..'Z').each do |l|
			map[val] = l
			val += 1
		end
		
		map
	end
	
end
