def main()

while (true) do

	puts 'Please, enter string of brackets like: [,],(,),{,}'
  puts 'Enter 0 to exit the program'

	user_line = gets.chomp

  if (user_line == '0') then
    break;
  end

  puts algorithm(user_line.split(""))
end
    puts 'app has been terminated'
end

def algorithm(user_line)
  res = 'True'
  brackets_stack = Array.new()

  user_line.each do |character|

  if is_bracket(character) == nil
  res = 'You have used not a bracket'

  elsif is_opening_bracket(character) != nil
      brackets_stack.push(character)

    elsif get_closing_bracket_from_opening_one(brackets_stack.last) == character
      brackets_stack.pop

    else
      res = 'False'
      break
    end
  end

return res
end

def is_bracket(bracket)
	return bracket =~ /[\(\)\[\]\{\}]/
end

def is_opening_bracket(bracket)
	return bracket =~ /[\(\[\{]/
end

def get_closing_bracket_from_opening_one(bracket)
	if bracket == "["
    return "]"
	elsif bracket == "("
    	return ")"
	else
    return "}"
	end
end

main()
