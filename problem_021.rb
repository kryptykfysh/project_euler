# Problem 21
# 05 July 2002

# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are 
# an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 
# 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

time_started = Time.now
puts "Started processing at #{time_started}."

upper_limit = 10000

def d(n)
  total = 1
  (2..(n**0.5).to_i).each do |i|
    total += n / i + i if n % i == 0
  end
  total
end

total = 0

1.upto(upper_limit) do |a|
  b = d(a)
  total += a if (a != b && d(b) == a)
end

puts "The sum of all amicable numbers under #{upper_limit} is: #{total}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."