require 'fileutils'

class Dictionary

	#using https://github.com/atebits/Words
	def initialize()
		#return a word dictionary in memory, sorted by word length
		
		words = File.readlines('en.txt').each {|l| l.chomp!}
		@dict = {}
		
		#store the words in a hash, where the keys are the word length
		words.each do |w|
			(@dict[w.length] ||= []) << w
		end
		
	end
	
	attr_accessor :dict
end