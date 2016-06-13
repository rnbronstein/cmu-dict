require_relative '../../config/environment.rb'

class Pronunciation < ActiveRecord::Base
  serialize :phonemes, Array
  serialize :last_syllable, Array
end
