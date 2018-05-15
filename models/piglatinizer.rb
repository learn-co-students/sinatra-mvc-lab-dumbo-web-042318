class PigLatinizer

  attr_reader :phrase

  def piglatinize(string)
    phrase_arr = string.split(" ")
    phrase_arr.map {|word| self.class.translate(word)}.join(" ")
  end

  def self.translate(word)
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    vowels = %w[a e i o u A E I O U]
    consonants = alphabet - vowels

    if vowels.include?(word[0])
      word + 'way'
    elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
      word[3..-1] + word[0..2] + 'ay'
    elsif consonants.include?(word[0]) && consonants.include?(word[1])
      word[2..-1] + word[0..1] + 'ay'
    elsif consonants.include?(word[0])
      word[1..-1] + word[0] + 'ay'
    else
      word # return unchanged
    end
  end

end
