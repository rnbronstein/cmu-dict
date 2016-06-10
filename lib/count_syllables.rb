require_relative '../config/environment.rb'

class CountSyllables
  include Readable
  include Matchable
  include Parsable

  attr_accessor :input

  def initialize(input)
    @input = input
    @match = self.match(input)
  end

  def count
    count = 0
    phonemes(@match).each do |phoneme|
      count += 1 if phoneme.chars.first =~ /[AEIOU]/
    end
    count
  end


end
