#Путь к файлу где лежит список загаданных слов
DICTIONARY_PATH = "./dictionary.txt"

def main()
  attempts = 5
  word = get_word()
	user_word = "?" * word.length()
	while attempts != 0 do

    puts "Your attempts count: "+attempts.to_s
		puts "Try to solve "+user_word
		puts "Enter letter: "
		letter = gets.chomp

    # получить список позиций такой буквы в загаданном слове
    letter_positions =  get_letter_positions(letter,word)
    # получить список позиций пуст => такой буквы нет => -попытка
    if 	letter_positions.length == 0
        attempts -= 1
    # в противном случае пройтись по списку позиций
    # и заменить в слове пользователя ? на угаданную букву
		else
      for j in 0..letter_positions.length()-1
      user_word[letter_positions[j].to_i] = letter
    end
    end


		if contains_unsolved(user_word) == nil
			puts "U have won"
			break
		end
	end

if attempts<=0
    puts "U have lost. Try again"
end
end

#Получить случайное слово из файла со списком слов
def get_word()
data = []
File.open(DICTIONARY_PATH, 'r') do |file|
  file.each_line { |x| data.push(x) }
  word = data[rand(data.length())].chomp

  return word
end
end

#Получить позицию введеной буквы в загаданном слове
#Возвращается массив, если таких позиций несколько
#Возвращается пустой массив, если таких позиций нет
def get_letter_positions(letter,word)
	positions = []
	for index in 0..word.length()
		if letter == word[index]
			positions << index
		end
	end
	return positions
end

#есть ли неразгаданный символ
def contains_unsolved(str)
	str =~ /[\?]/
end

#вызов main
main()
