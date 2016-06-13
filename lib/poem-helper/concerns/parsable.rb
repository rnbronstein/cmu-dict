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
    index = ph.rindex(last_vowel(line)) unless vowels(line).nil?
    index ? last_syl = ph.last(ph.length - index) : last_syl = ph
    last_syl.join
  end

  private

  def last_vowel(line)
    vowels(line).last
  end
end
