require 'pry'

#SPAGHETTI CODE!


# module Parser
#   #define syllable rules and parse dictionary entries
#
#   @@vowels = "AEIOU".chars
#
#   attr_reader :line
#
  # def initialize(line)
  #   @line = line
  # end
  #
  # def word
  #   parts = line.split
  #   parts.shift
  # end
#
#   def parse
#     parts = line.split
#     #handle entries that include an entry number (i.e. multiples)
#     first_part = parts.first.to_i
#     parts.shift unless first_part == 0
#
#     #return phonemes
#     parts
#   end
#
# end

#retrieve word
#format word
#search dictionary
#retrieve phonemes
#count phonemes




class Word

  attr_reader :input, :dictionary_entries

  def initialize(input, dictionary_entries)
    @input = input
    @dictionary_entries = dictionary_entries
  end

  def search
    dictionary_entries.map do |entry|
      entry if entry.include?(input)
    end
  end

end


class Counter

  @@vowels = "AEIOU".chars

  attr_reader :input, :matches

  def initialize(input, matches)
    @input = input
    @matches = matches
  end


  def actual_matches
    #remove close matches i.e. ["banana", "bananas"]
    actual = []
    if matches.count > 1
      matches.each do |entry|
        w = entry.split.first
        actual << entry if w == input
      end
      actual
    else
      @match = matches.first #recurring pronunciations have same syllable count
    end
  end

  # def to_phoneme
  #   if actual_matches.count > 1
  #     actual_matches.each do |match|
  #       parse_for_phonemes(match)
  #     end
  #   else
  #   parse_for_phonemes(actual_matches)
  #   end
  # end

  def parse_for_phonemes(match)
    str = match.to_s
    parts = str.split
    #remove word from entry
    parts.shift
    #handle entries that include an entry number (i.e. multiples)
    first_part = parts.first.to_i
    parts.shift unless first_part == 0
    #return phonemes
    parts
  end

  def syllable_count(phonemes)
    count = 0
    phonemes.each do |phoneme|
      first_letter = phoneme.chars.first
      count +=1 if @@vowels.any?{|v| v == first_letter }
    end
    count
  end

  def result
    # binding.pry
    result = {}
    possible_syllables = []
    if actual_matches.count > 1
      actual_matches.each do |entry|
        #clean this up with yield
        phonemes = parse_for_phonemes(entry)
        syllables = syllable_count(phonemes)
        possible_syllables << syllables
      end
      if possible_syllables.uniq.count == 3
        result = "#{input} can be pronounced with either #{possible_syllables[0]}, #{possible_syllables[1]}, or #{possible_syllables[2]} syllables."
      elsif possible_syllables.uniq.count == 2
        result = "#{input} can be pronounced with either #{possible_syllables[0]} or #{possible_syllables[1]} syllables."
      else
        result = possible_syllables.uniq.join
      end
    else
      phonemes = parse_for_phonemes(actual_matches)
      syllables = syllable_count(phonemes)
      result = syllables
    end
    result
  end

end
