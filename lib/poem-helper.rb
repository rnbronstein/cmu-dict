require_relative '../config/environment.rb'

class PoemHelper

  attr_reader :input

  def initialize(input)
    @input = input.upcase
  end

  def rhymes
    entry = Pronunciation.find(word: @input)
    Pronunciation.where(last_syllable: entry.last_syllable)
  end

end
