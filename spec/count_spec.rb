require_relative 'spec_helper.rb'
require_relative '../config/environment.rb'

describe CountSyllables do
  let!(:counter) { CountSyllables.new(@input = "APPLE") }

  it 'can find a dictionary entry for a given word' do
    expect(counter.match(@input)).to eq("APPLE 1 AE1 P AH0 L")
  end

  it 'rejects entries that contain the given word but do not match them' do
    expect(counter.match(@input)).not_to eq("APPLEANS 1 AH0 P L IY1 N Z")
  end

  it 'returns the correct syllable count for a given word' do
    expect(counter.count).to eq(2)
  end

end
