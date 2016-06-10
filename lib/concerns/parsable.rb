module Parsable

  def phonemes(line)
    # binding.pry
    line.split.drop(2)
  end

  def vowels(line)
    phonemes(line).select do |phoneme|
      phoneme if phoneme.chars.first =~ /[AEIOU]/
    end
  end

  def last_syllable(entry)
    if phonemes(entry).last == vowels(entry).last
      vowels(entry).last
    else
      phonemes(entry).last(2)
    end
  end

end
