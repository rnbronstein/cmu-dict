require_relative '../../config/environment.rb'

class CountSyllables
  include Readable
  include Matchable
  include Parsable

  attr_reader :input

  def initialize(input)
    @input = input.upcase
    @match = self.match(@input)
  end

  def count
    vowels(@match).count
  end


end
