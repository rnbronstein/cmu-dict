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

end
