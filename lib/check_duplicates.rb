require_relative '../config/environment.rb'

class CheckDuplicates
  include Readable

  def self.all_multiples
    DICT.map do |line|
      line if multiple?(line)
    end
  end

  def self.handle_multiples(input)
    if all_multiples.include?(input)
      ##do something
    end
  end

  private
  def self.multiple?(line)
    parts = line.split(" ")
    parts[1].to_i > 1
  end

end
