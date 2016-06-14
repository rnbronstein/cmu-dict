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
    <<-HAIKU
      #{make_line(words, 5).join(" ")}
      #{make_line(words, 7).join(" ")}
      #{make_line(words, 5).join(" ")}
    HAIKU
  end

  private

  def self.choose_random_words
    Pronunciation.order('RANDOM()').where('syllable_count < 4').take(10)
  end

  def self.make_line(word_array, num)
    results = []
    count = 0
    word_array.each do |w|
      if count + w.syllable_count <= num
        results << w.word
        count += w.syllable_count
      end
    end
    results
  end

  def self.lookup_multiple(input_array)
    # binding.pry
    obj_array = []
    input_array.each do |word|
      next if lookup(word).nil?
      obj_array << lookup(word)
    end
    obj_array
  end

end
