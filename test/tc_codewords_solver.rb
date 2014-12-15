require_relative '../codewords_solver'
require 'test/unit'
require_relative '../dictionary'

class TestCodewordsSolver < Test::Unit::TestCase

	def test_valid_state
		
		assert_equal(true, CodewordsSolver.valid_state?( 
		[[ 3,1,20 ]],  #cat
		CodewordsSolver.get_full_letter_map,
		Dictionary.new.dict ))
		
		assert_equal(false, CodewordsSolver.valid_state?( 
		[[ 3,26,20 ]],  #czt
		CodewordsSolver.get_full_letter_map,
		Dictionary.new.dict ))
		
		assert_equal(true, CodewordsSolver.valid_state?( 
		[[ 3,1,20 ], [ 2,1,20 ]],  #cat, bat
		CodewordsSolver.get_full_letter_map,
		Dictionary.new.dict ))
		
		assert_equal(false, CodewordsSolver.valid_state?( 
		[[ 3,1,20 ], [ 3,26,20 ]],  #cat, czt
		CodewordsSolver.get_full_letter_map,
		Dictionary.new.dict ))
	end
	
end