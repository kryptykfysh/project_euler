# Problem 26
# 13 September 2002

# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

# 1/2 =   0.5
# 1/3 =   0.(3)
# 1/4 =   0.25
# 1/5 =   0.2
# 1/6 =   0.1(6)
# 1/7 =   0.(142857)
# 1/8 =   0.125
# 1/9 =   0.(1)
# 1/10  =   0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

require 'mathn'

time_started = Time.now
puts "Started processing at #{time_started}."

limit = 7

longest_recurring_cyle = 0
longest_recurring_cycle_denominator = 0

1.upto(limit) do |denominator|
  array_of_digits = []
  Rational("1/#{denominator}").to_f.to_s.each_char do |char|
    array_of_digits << char
  end
  2.times { array_of_digits.shift }
  array_of_digits.each do |digit|
    puts array_of_digits.inspect
  end
end

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."