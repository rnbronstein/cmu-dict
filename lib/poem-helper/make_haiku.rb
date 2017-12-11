# require_relative '../../config/environment.rb'
#
# class MakeHaiku < PoemHelper
#
#   def self.random_haiku
#     create_haiku(choose_random_words)
#   end
#
#   def self.haiku_from_input(input)
#     create_haiku(input)
#   end
#
#   private
#
#   def self.create_haiku(source)
#     <<-HAIKU
#       #{make_line(source, 5).join(" ")}
#       #{make_line(source, 7).join(" ")}
#       #{make_line(source, 5).join(" ")}
#     HAIKU
#   end
# 
#   def self.choose_random_words
#     Pronunciation.order('RANDOM()').where('syllable_count < 4').take(10)
#   end
#
#   def self.make_line(word_array, num)
#     results = []
#     count = 0
#     word_array.each do |w|
#       if count + w.syllable_count <= num
#         words << w.word
#         count += w.syllable_count
#       end
#     end
#     results
#   end
# end
