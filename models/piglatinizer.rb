class PigLatinizer
  attr_accessor :text

  def initialize

  end

  def split_sentence(text)
    split_sentence = text.split(" ")
  end

  def piglatinize(text)
    new_sentence = split_sentence(text).reject(&:empty?)
    final_sentence = []
    new_sentence.each do |word|
      new_word = edit_word(word)
      final_sentence << new_word
    end
    final_sentence.join(' ')
  end

  def edit_word(word)
    vowels = "aeouiAEOUI"
    if vowels.include?(word[0])
      word + "way"
    elsif !word.scan(/\A[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWYZ]{3}/).empty?
      first_two_letter = word.scan(/\A[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWYZ]{3}/)
      split_word = word.split('')
      split_word.shift(3)
      ending = first_two_letter << "ay"
      new_word = split_word << ending
      new_word.join("")
    elsif !word.scan(/\A[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWYZ]{2}/).empty?
      first_two_letter = word.scan(/\A[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWYZ]{2}/)
      split_word = word.split('')
      split_word.shift(2)
      ending = first_two_letter << "ay"
      new_word = split_word << ending
      new_word.join("")
    else
      split_word = word.split('')
      first_letter = split_word.shift
      ending = first_letter + "ay"
      new_word = split_word << ending
      new_word.join("")
    end
  end

end
