# Problem 23
# 02 August 2002

# A perfect number is a number for which the sum of its proper 
# divisors is exactly equal to the number. For example, the sum 
# of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
# which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper 
# divisors is less than n and it is called abundant if this sum 
# exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
# the smallest number that can be written as the sum of two 
# abundant numbers is 24. By mathematical analysis, it can be 
# shown that all integers greater than 28123 can be written as 
# the sum of two abundant numbers. However, this upper limit 
# cannot be reduced any further by analysis even though it is 
# known that the greatest number that cannot be expressed as the 
# sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.

time_started = Time.now
puts "Started processing at #{time_started}."

def d(n)
  return 0 if n == 1
  total = 1
  (2..(n**0.5).to_i).each do |i|
    if n % i == 0
      total += n / i
      total += i unless i == Math.sqrt(n) 
    end
  end
  total
end

def is_abundant?(num)
  num < d(num)
end

max_value = 28123

abundant_numbers = (1..max_value).select { |i| is_abundant?(i) }

sums_of_two_abundant_numbers = []

abundant_numbers.each do |a|
  abundant_numbers.each do |b|
    break if a + b > max_value
    sums_of_two_abundant_numbers << (a + b)
  end
end

sums_of_two_abundant_numbers.uniq!

normal_numbers = (1..28123).to_a

total = (normal_numbers - sums_of_two_abundant_numbers).reduce(:+)

puts total



time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."