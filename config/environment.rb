Dir["lib/*.rb"].each {|f| require f}
Dir["bin/*.rb"].each {|f| require f}
require_relative '../cmudict'

require "pry"
