require_relative '../lib/syllableizer.rb'

file = "cmudict"
full_dictionary = File.read(file)
words = full_dictionary.lines

puts "Enter a word, please: "
input = gets.chomp.upcase

matches = Word.new(input, words).search
puts Counter.new(input, matches).result
