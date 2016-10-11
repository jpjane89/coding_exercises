def decompress(sequence)
	string = ''

	while sequence.length > 0
		checksum = sequence.shift
		bit = []

		if sequence.length > 0
			next_char = sequence.shift
			bit.push(next_char)
		else 
			raise "Invalid input"
		end

		while sequence.length > 0 and next_char.is_a? String
			next_char = sequence.shift
			bit.push(next_char)
		end

		if sequence.length == 0
			raise "Invalid input"
		else
			repetition = sequence.shift
			sub_string = ''
			while repetition > 0
				sub_string += bit.join # sub_string holds the expanded bit
				repetition -= 1
			end
			string += sub_string
		end
	end
end

def decompress(sequence)
	string = ''

	while sequence.length > 0
		checksum = sequence.shift
		bit = []

		if sequence.length > 0
			next_char = sequence.shift
			bit.push(next_char)
		else 
			raise "Invalid input"
		end

		while sequence.length > 0 and next_char.is_a? String
			next_char = sequence.shift
			bit.push(next_char)
		end

		if sequence.length == 0
			raise "Invalid input"
		else
			repetition = sequence.shift
			while repetition > 0
				string += bit.join # no creation of expanded sub_string
				repetition -= 1
			end
		end
	end
end


def the_same?(sequence, string)
	if decompress(sequence) == string
		return true
	else
		return false
	end
end

# this function will compare the corresponding sections of the sequence and expanded string
# will need to know the current checksum, repetition value, and where the current starting position is in both 
# the sequence and the string
def the_same?(sequence, string)
	string_start = 0 
	sequence_start = 0

	while string[string_start] and sequence[sequence_start] # check that we aren't at the end of string and/or sequence
		checksum = sequence[string_start]
		repetition = sequence[checksum+1]

		for i in string_start..(string_start+(checksum*repetition) - 1)
			k = (i - string_start) % checksum + sequence_start + 1
			return false if string[i] != sequence[k] 
		end

		string_start += (checksum*repetition)
		sequence_start += repetition + 1

	end

	if string[string_start] # there is still string left but no sequence -- return false
		return false
	elsif sequence[sequence_start] # there is sequence left but no string -- return false
		return false
	else # both string and sequence have been consumed entirely -- return true
		return true
	end
end
