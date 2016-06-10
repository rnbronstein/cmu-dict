require_relative '../../config/environment.rb'
require_relative 'concerns/readable.rb'
require_relative 'concerns/matchable.rb'
require_relative 'concerns/parsable.rb'

class DatabaseInitializer < ActiveRecord::Base
  include Readable
  include Matchable
  include Parsable

  def add_words
    DICT.each do |entry|
      
      Pronunciation.create(word: word(entry))
    end
  end

  def add_phonemes
    DICT.each do |entry|
      word = Pronunciation.find(word: word(entry))
      word.phonemes = phonemes(entry)
    end
  end

  def add_last_syllable
    DICT.each do |entry|
      word = Dictonary.find(word: word(entry))
      word.last_syllable = last_syllable(entry)
    end
  end

  def add_syllable_count
    DICT.each do |entry|
      word = Pronunciation.find(word: word(entry))
      word.syllable_count = vowels(entry).count
    end
  end

end
