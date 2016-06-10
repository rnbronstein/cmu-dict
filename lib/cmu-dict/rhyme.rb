require_relative '../../config/environment.rb'

class Rhyme
  include Readable
  include Matchable
  include Parsable

  attr_reader :input

  def initialize(input)
    @input = input.upcase
    @match = self.match(input)
  end

  def rhyme_matches
    DICT.select do |entry|
      last_syllable(entry) == last_syllable(@match)
      # binding.pry
    end
  end

  def rhymes
    rhyme_matches.collect do |match|
      word(match)
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
