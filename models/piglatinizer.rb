class PigLatinizer
  def initialize(str='')
    @str=str
  end

  def piglatinize_all
    length = @str.split(" ").length #gets the length
    if length>1
      new_str = @str.split.collect { |word| piglatinize(word) }.join(" ")
    else
      new_str=piglatinize(@str)
    end
    puts new_str
    new_str
  end

  def consonant?(char)
    if char!=nil
      if char.match(/[aAeEiIoOuU]/)
        false
      else
        true
      end
    end
  end

  def piglatinize(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
end

end
