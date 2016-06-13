module Parsable

  def phonemes(line)
    line.split.drop(2)
  end

  def vowels(line)
    phonemes(line).select do |phoneme|
      phoneme if phoneme.chars.first =~ /[AEIOU]/
    end
  end

  def last_syllable(line)
    #the last vowel plus any phonemes after
    ph = phonemes(line)
    index = ph.find_index(last_vowel(line)) unless vowels(line).nil?
    if index
      ph.last(ph.length - index)
    else
      ph
    end
  end

  private

  def last_vowel(line)
    vowels(line).last
  end
end
