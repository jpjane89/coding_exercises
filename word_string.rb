def can_we_find_words(string)
	if is_word(string)
		return true
	else
		combos = create_permutations(string)
			combos.each do |combo|
				if can_we_find_words(combo[0]) and can_we_find_words(combo[1])
					return true
				end
			end
		return false 
	end
end

# we assume `create_permutations` is a function that returns all the ways the string could be split in half:
# example of combos for the string 'aban' = [('a', 'ban'), ('ab', 'an'), ('aba' 'n')]

# we assume `is_word` is a function that returns true or false based on whether the 
# word is a valid Enlgish word

