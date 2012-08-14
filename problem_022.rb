# Problem 22
# 19 July 2002

# Using names.txt (right click and 'Save Link/Target As...'), a 46K 
# text file containing over five-thousand first names, begin by 
# sorting it into alphabetical order. Then working out the 
# alphabetical value for each name, multiply this value by its 
# alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, 
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name 
# in the list. So, COLIN would obtain a score of 938  53 = 49714.

# What is the total of all the name scores in the file?

time_started = Time.now
puts "Started processing at #{time_started}."

names = File.new("source_022/names.txt", "r").read.scan(/[a-z]+/i).sort

alphabetical_values = {}

letter_value = 0

('a'..'z').each do |letter|
  letter_value += 1
  alphabetical_values[letter] = letter_value
end

name_score_total = 0
name_position = 0

names.each do |n|
  name_position += 1
  n.each_char do |char|
    name_score_total += alphabetical_values[char.downcase] * name_position
  end
end

puts "The total of all name scores is: #{name_score_total}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."