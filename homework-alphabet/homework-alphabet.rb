# main
def main()
	puts "Enter text to convert it: "
	text = gets.chomp.downcase
	result = get_alphabit_position(text)
	puts result
end

# Принадлежит ли переданный символ диапазону [a-z]
def is_letter(character)
	character =~ /[a-z]/
end

# конвертировать текст в числовую позицию такого символа в алфавите
def get_alphabit_position(text)
	indexes_str = ""
	i = 0
while i <= text.length()
		if is_letter(text[i]) != nil
			indexes_str += (text[i].ord-96).to_s+" "
		end
		i+=1
	end
	return indexes_str
end

# вызов main
main()
