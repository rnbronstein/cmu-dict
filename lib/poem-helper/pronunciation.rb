require_relative '../../config/environment.rb'

class Pronunciation < ActiveRecord::Base
  serialize :phonemes, Array
end
