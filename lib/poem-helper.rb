require_relative '../config/environment.rb'

class PoemHelper
  attr_accessor :input, :phoneme

  def initialize(input, phoneme = nil)
    @input = input
    @phoneme = phoneme
  end

  def lookup
    #add optional phoneme argument to allow users to specify which pronunciation
    formatted = input.gsub(/\W+/, "").squeeze(" ").strip.upcase
    if phoneme
      set = Pronunciation.where('phonemes LIKE ?', "%#{phoneme}%")
      set.find_by(word: formatted)
    else
      Pronunciation.find_by(word: formatted)
    end
  end

  def rhymes
    Pronunciation.where(last_syllable: lookup.last_syllable).pluck(:word)
  end

  def syllable_count
    lookup.syllable_count
  end

  def phonemes
    lookup.phonemes
  end

  def last_syllable
    lookup.last_syllable
  end


end
