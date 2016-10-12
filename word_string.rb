def can_we_find_words(string)
	if string == ""
		return false
	elsif is_word(string)
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

def create_permutations(string)
	permutations = []

	if string.length == 1
		return string
	elsif string.length == 2
		return [string[0], string[1]]
	else
		(0..string.length-2).each do |i|
			combo = [string[0..i].join("")] + [string[i+1..string.length-1].join("")]
			permutations.push(combo)
		end
	return permutations
	end
end

# we assume `is_word` is a function that returns true or false based on whether the 
# word is a valid Enlgish word

