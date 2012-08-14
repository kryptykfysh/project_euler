# Problem 20
# 21 June 2002

# n! means n  (n  1)  ...  3  2  1

# For example, 10! = 10  9  ...  3  2  1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

time_started = Time.now
puts "Started processing at #{time_started}."

number_to_start = 100

array_of_numbers = []

(number_to_start).downto(1) do |i|
  array_of_numbers << i
end

array_of_digits = []

array_of_numbers.reduce(:*).to_s.each_char { |x| array_of_digits.push(x.to_i) }

sum_of_digits = array_of_digits.reduce(:+)

puts "The sum of digits in #{number_to_start}! is: #{sum_of_digits}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."