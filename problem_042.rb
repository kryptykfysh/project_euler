# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so 
# the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its 
# alphabetical position and adding these values we form a word value. For 
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value 
# is a triangle number then we shall call the word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file 
# containing nearly two-thousand common English words, how many are triangle 
# words?

require 'csv'
require 'benchmark'

def letter_hash
  letters = ('A'..'Z')
  Hash[letters.map.with_index(1) { |letter, i| [letter, i] } ]
end

def triangulate(n)
  (n / 2.0) * (n + 1)
end

def is_triangle_number?(num)
  n = 1
  until triangulate(n) >= num
    n += 1
  end

  triangulate(n) == num
end

def word_value(word)
  word.split(//).inject(0) { |sum, letter| sum + letter_hash[letter] }
end

def count_triangle_words(file='problem_042_words.txt')
  data = CSV.read(file)[0]
  data.inject(0) { |sum, word| sum + (is_triangle_number?(word_value(word)) ? 1 : 0) }
end

if $0 == __FILE__
  puts count_triangle_words
  
  Benchmark.bm do |x|
    x.report { count_triangle_words }
  end
end