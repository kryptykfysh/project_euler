# The sum of the squares of the first ten natural numbers is,

# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

time_started = Time.now
puts "Started processing at #{time_started}."

range_maximum = 100
values = (1..range_maximum)

squared_values = values.to_a.collect { |i| i*i }

sum_of_squares = squared_values.reduce(:+)
square_of_sum = values.reduce(:+) * values.reduce(:+)
difference = square_of_sum - sum_of_squares

puts "The difference in the sum of the squares (#{sum_of_squares})"
puts "and the square of the sums (#{square_of_sum}) of the first"
puts "#{range_maximum} natural numbers is: #{difference}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."