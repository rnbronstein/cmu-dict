module Matchable

  def dictionary
    Readable::DICT
  end

  def match(input)
    dictionary.detect{|line| input == word(line)}.strip
  end

  private

  def word(line)
    line.split(" ")[0]
  end

end
