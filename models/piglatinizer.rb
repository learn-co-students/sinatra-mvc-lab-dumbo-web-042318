class PigLatinizer 
  def piglatinize(text)
    text_arr = text.split(" ")
    text_arr.map do |word|
      pig_one(word)
    end.join(" ")
  end

  def pig_one(word)
    return word + "way" if word[0].match(/[aeiou]/i)
    consons = word.scan(/([^aeiou]+)\w+/i).flatten[0]
    "#{word[consons.length..-1]}#{consons}ay"
  end
end
