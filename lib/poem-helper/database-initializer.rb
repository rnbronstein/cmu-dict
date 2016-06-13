require_relative '../../config/environment.rb'
# require_relative 'concerns/readable.rb'
# require_relative 'concerns/matchable.rb'
# require_relative 'concerns/parsable.rb'

class DatabaseInitializer
  include Readable
  include Matchable
  extend Matchable
  include Parsable
  extend Parsable

  def self.add_words
    DICT.each do |entry|
      puts word(entry)
      Pronunciation.create(word: word(entry), phonemes: phonemes(entry), last_syllable: last_syllable(entry), syllable_count: vowels(entry).count)
    end
  end

  def self.update_information
    DICT.each do |entry|
      puts word(entry)
      word = Pronunciation.find_by(word: word(entry))
      word.update(last_syllable: last_syllable(entry))
    end
  end
  #
  # def self.add_last_syllable
  #   DICT.each do |entry|
  #     word = Pronunciation.find_by(word: word(entry))
  #     word.last_syllable = last_syllable(entry)
  #     word.save
  #   end
  # end
  #
  # def self.add_syllable_count
  #   DICT.each do |entry|
  #     word = Pronunciation.find_by(word: word(entry))
  #     word.syllable_count = vowels(entry).count
  #     word.save
  #   end
  # end


end
