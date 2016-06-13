require 'active_record'

class CreatePronunciations < ActiveRecord::Migration
  def change
    drop_table :pronunciations

    create_table :pronunciations do |t|
      t.string "word"
      t.string "phonemes"
      t.string "last_syllable"
      t.integer "syllable_count"
    end
  end
end
