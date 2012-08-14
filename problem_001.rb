# If we list all the natural numbers below 10 
# that are multiples of 3 or 5, we get 3, 5, 
# 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 
# 5 below 1000.

time_started = Time.now
puts "Started processing at #{time_started}."

sum_of_multiples = 0

1.upto(999) { |number| sum_of_multiples += number if number % 3 == 0 || number % 5 == 0 }

puts "The sum of the multiples is: #{sum_of_multiples}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."