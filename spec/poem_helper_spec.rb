require_relative 'spec_helper.rb'
require_relative '../config/environment.rb'

describe PoemHelper do
  it 'can identify a rhyme' do
    expect(PoemHelper.rhymes("TONIGHT")).to include("RIGHT")
  end

  it 'does not include close rhymes' do
    expect(PoemHelper.rhymes("TONIGHT")).not_to include("TIME")
  end

  it 'knows how many syllables are in a word' do
    expect(PoemHelper.syllable_count("TONIGHT")).to eq(2)
  end

  it 'knows what phonemes are in a word' do
    expect(PoemHelper.phonemes("TONIGHT")).to eq(["T", "AH0", "N", "AY1", "T"])
  end

  it 'correctly determines the last syllable of a word' do
    expect(PoemHelper.last_syllable("TONIGHT")).to eq('AY1T')
  end

  it 'can retrieve an entry for a lowercase word' do
    expect(PoemHelper.lookup("tonight")).to eq(PoemHelper.lookup("TONIGHT"))
  end

end
