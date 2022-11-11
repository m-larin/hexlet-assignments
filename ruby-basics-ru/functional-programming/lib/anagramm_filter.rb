# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, words)
  word_as_arr = word.chars.sort

  words.filter do |item|
    item.chars.sort == word_as_arr
  end
end
# END
