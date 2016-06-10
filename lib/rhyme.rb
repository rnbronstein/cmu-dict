class Rhyme
  include Readable
  include Matchable
  include Parsable

  attr_reader :input

  def initialize(input)
    @input = input
    @match = self.match(input)
  end

  def matched_phonemes
  end

private

  def last_syllable
    if @match.phonemes.last == @match.vowels.last
      @match.vowels.last
    else
      @match.vowels.last.to_s + @match.phonemes.last.to_s
    end
  end


end
