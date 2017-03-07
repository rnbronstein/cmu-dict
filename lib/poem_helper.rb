require_relative '../config/environment.rb'

class PoemHelper

  def self.lookup(input)
    formatted = input.gsub(/\W+/, "").squeeze(" ").strip.upcase
    # binding.pry
    Pronunciation.find_by(word: formatted)
  end

  def self.rhymes(input)
    Pronunciation.where(last_syllable: lookup(input).last_syllable).pluck(:word)
  end

  def self.syllable_count(input)
    lookup(input).syllable_count
  end

  def self.phonemes(input)
    lookup(input).phonemes
  end

  def self.last_syllable(input)
    lookup(input).last_syllable
  end

end

class MakeHaiku < PoemHelper

  def self.random_haiku
    <<-HAIKU
      #{make_line(choose_random_words, 5).join(" ")}
      #{make_line(choose_random_words, 7).join(" ")}
      #{make_line(choose_random_words, 5).join(" ")}
    HAIKU
  end

  def self.haiku_from_input(input)
    words = lookup_multiple(input.split)
    first_line = make_line(words, 5)
    l = first_line.length
    binding.pry
    second_line = make_line(words, 7)
    l = second_line.length
    third_line = make_line(y, 5)
    <<-HAIKU
      #{first_line.pluck(:word).join(" ")}
      #{second_line.pluck(:word).join(" ")}
      #{third_line.pluck(:word).join(" ")}
    HAIKU
  end

  private

  def self.choose_random_words
    Pronunciation.order('RANDOM()').where('syllable_count < 4').take(10)
  end

  def self.make_line(word_array, num)
    results = []
    count = 0
    i = 0

    until ((count == num) || (i > word_array.length)) do
        syl_count = word_array[i].syllable_count
        if count + syl_count <= num
            results << word_array[i]
            count += syl_count
        elsif syl_count <= num
            results = [word_array[i]]
            count = syl_count
        else
            results = []
            count = 0
        end
        word_array = word_array[i..-1]
        i += 1
    end
  end

  def self.lookup_multiple(input_array)
    obj_array = []
    input_array.each do |word|
      next if lookup(word).nil?
      obj_array << lookup(word)
    end
    obj_array
  end

end
