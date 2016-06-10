require 'active_record'

conf = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection conf[ENV['DB']]

Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/concerns", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/poem-helper", "*.rb")].each {|f| require f}
