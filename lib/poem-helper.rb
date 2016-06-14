require_relative '../config/environment.rb'

class PoemHelper

  def self.lookup(input, *phoneme)
    if phoneme
      set = Pronunciation.where('phonemes LIKE %')
      set.find_by(word: input.upcase)
    end
  end

  def self.rhymes(input)
    Pronunciation.where(last_syllable: lookup(input).last_syllable).pluck(:word)
  end

  def self.syllable_count(input)
    lookup(input).syllable_count
  end

  def self.phonemes(input)
    lookup(input).phonemes
  end

  def self.last_syllable(input)
    lookup(input).last_syllable
  end


end
