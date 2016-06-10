require "pry"

# Dir["lib/*.rb"].each {|f| require f}
# Dir["lib/concerns/*.rb"].each {|f| require f}
# Dir["bin/*.rb"].each {|f| require f}
require_relative '../cmudict'
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../bin", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/concerns", "*.rb")].each {|f| require f}
