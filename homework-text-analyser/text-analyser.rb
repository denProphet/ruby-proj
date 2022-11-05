# TODO:
# Write a program to analyse text
#
# returns: array of the most occurring words (Top 3)(desc)
# arg: string of text (possibly with punctuation and || | )
#
# requirements:
#
# * Characters (eg #, \, /,. ...) are not part of a word and should be treated as spaces.
# * Resulted words have to be downcased
# * The word is a string of letters (a to z)
# * Returns top-2 or top-1 (if text contains less than 3 unique words)
# * Returns an empty array (if the text contains no words)

# String example: In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income."
# String example: la pa la pa pa you hh you you you

#-------------------------------------

# get text from user's console
def getText()
  puts 'Enter your text to get most frequent words: '
  return gets.chomp
end

# get distinctive seperated words from text using hash way
def getWordsHashcode(text)
    distinctive = Hash.new
    #split text by spec symbols
    words = text.split(/[\\#\/\|.,\s*]/).reject { |c| c.empty? }

    for word in words
      expr = word.downcase

    if distinctive.has_key? expr
      distinctive[expr] += 1
    else
      distinctive.store(expr, 1)
    end

  end
    return distinctive
end

# get top common words from distinctive ones
def analyseAndGetWordsTop(distinctive, topCount)
    words = distinctive.reject{|_key, value| value < 2}.sort_by {|_key, value| value}.reverse.to_h
    top = []
    for i in 0..topCount-1
        top[i] = words.keys[i] if !words.keys[i].nil?
      end
    return top
end

# main
def main
top = analyseAndGetWordsTop(getWordsHashcode(getText()), 3)

puts "Top count: #{top.length()}"
puts "Top common words: #{top}"
end

main
