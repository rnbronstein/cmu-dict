require_relative '../config/environment.rb'

class PoemHelper

  def self.lookup(input)
    Pronunciation.find_by(word: (input.upcase))
  end

  def self.rhymes(input)
    Pronunciation.where(last_syllable: lookup(input).last_syllable)
  end

  def self.syllable_count(input)
    lookup(input).count
  end

  def self.phonemes(input)
    lookup(input).phonemes
  end

  def self.stress(input)
    lookup(input).phonemes.select do |p|
      p.chars.include?("0")
    end
  end

  def self.last_syllable(input)
    lookup(input).last_syllable
  end

end
