#!/usr/bin/env ruby

require_relative 'codewords_solver'
require_relative 'dictionary'

#	Fill in the codewords: 
#	(order of words in array doesn't matter)
words = [
#across
[ 20,13,23,14,8,16,4,18,11 ],
[ 7,24,11,7,20,8 ],
[ 22,17,22,20,23,16 ],
[ 18,1,23,14,7 ],
[ 15,18,1,9,18,20,22,8,18,13,1 ],
[ 18,1,1,7,14 ],
[ 23,11,10,13,22,9 ],
[ 20,7,22,16,7,9 ],
[ 10,22,25,18,7,16,8 ],
[ 17,22,14,7,26,22,20,7,9 ],
[ 1,7,2,16,11,14,18,1,8 ],
[ 3,7,8,26,13,18,10 ],
[ 20,13,18,10,7,9 ],
[ 15,18,14,8,23,7 ],
[ 9,14,22,26,8 ],
[ 14,7,18,1,15,7,1,8,18,13,1 ],
[ 7,22,14,7,9 ],
[ 7,24,8,7,1,8 ],
[ 11,7,7,14,7,9 ],
[ 6,7,21,16,8,14,13,6,7 ],
#down
[ 20,10,18,19,23,7 ],
[ 3,23,9,5,7 ],
[ 23,16,23,22,10 ],
[ 22,8,8,14,22,20,8 ],
[ 8,7,7,1,22,5,7 ],
[ 13,26,8,7,1 ],
[ 4,22,15,7 ],
[ 5,22,10,10,7,14,21 ],
[ 11,13,1,9 ],
[ 9,7,16,20,14,18,17,7 ],
[ 7,24,18,10,7,9 ],
[ 16,18,10,15,7,14 ],
[ 11,14,22,18,16,7 ],
[ 10,7,22,1,7,9 ],
[ 20,4,18,10,9,14,7,1 ],
[ 16,18,20,6 ],
[ 7,1,9,10,7,16,16 ],
[ 7,1,15,21 ],
[ 17,10,18,8,25 ],
[ 14,22,18,12,7,1,8 ],
[ 20,13,1,9,7,12,1 ],
[ 8,13,14,16,13 ],
[ 16,8,14,23,8 ],
[ 12,7,9,9,10,7 ]
]

#Fill in the initial letters that are given:
letter_map = { 10 => 'L', 13 => 'O', 18 => 'I', 26 => 'F' }

#dictionary
dict = Dictionary.new.dict

if not CodewordsSolver.valid_data?( words )
	abort
end

#	if you are just stuck on one word, you can get a list of
#	all possible words given the codeword and current letter map:

#p CodewordsSolver.word_possibilites( [ 13,26,8,7,1 ], { 10 => 'L', 13 => 'O', 18 => 'I', 26 => 'F', 3=>'J', 7=>'E', 8=>'T' }, dict )

CodewordsSolver.solve( words, letter_map, dict )



