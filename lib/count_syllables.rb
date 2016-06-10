class CountSyllables
  include Readable

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def match_input_with_entry
    OUTPUT.map {|entry| entry if entry.include?(input)}
  end


end
