require_relative 'spec_helper.rb'
require_relative '../config/environment.rb'

describe PoemHelper do
  let!(:instance) { PoemHelper.new(@input = "TONIGHT") }

  it 'can identify a rhyme' do
    expect(instance.rhymes).to include("RIGHT")
  end

  it 'does not include close rhymes' do
    expect(instance.rhymes).not_to include("TIME")
  end

  it 'knows how many syllables are in a word' do
    expect(instance.count).to eq(2)
  end

  it 'knows what phonemes are in a word' do
    expect(instance.phonemes).to eq('["T", "UW0", "N", "AY1", "T"]')
  end

  it 'correctly determines the last syllable of a word'


end
