require "pry"

Dir[File.join(File.dirname(__FILE__), "../lib/concerns", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/cmu-dict", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../bin", "*.rb")].each {|f| require f}
