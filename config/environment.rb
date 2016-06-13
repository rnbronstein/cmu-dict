require 'active_record'
require 'pry'

connection = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/pronunciations.sqlite"
)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS pronunciations (
  id INTEGER PRIMARY KEY,
  word TEXT,
  phonemes TEXT,
  last_syllable TEXT,
  count INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql)


Dir[File.join(File.dirname(__FILE__), "../lib/poem-helper/concerns", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/poem-helper", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
