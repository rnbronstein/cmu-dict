class CreateDictionary < ActiveRecord::Migrations
  def change
    create :dictionary do |t|
      t.string "word"
      t.string "phonemes"
      t.string "last_syllable"
      t.string "syllable_count"
    end
  end
end
