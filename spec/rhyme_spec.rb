require_relative 'spec_helper.rb'
require_relative '../config/environment.rb'

describe Rhyme do
  let!(:instance) { Rhyme.new(@input = "LINE") }

  it 'can identify a rhyme' do
    expect(instance.rhymes).to include("FINE")
  end

  it 'does not include close rhymes' do
    expect(instance.rhymes).not_to include("LIME")
  end

end
