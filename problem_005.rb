# 2520 is the smallest number that can be divided by 
# each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly 
# divisible by all of the numbers from 1 to 20?

time_started = Time.now
puts "Started processing at #{Time.now}."

largest_denominator = 20
denominators = 1..largest_denominator

def divisible_by_all?(numerator, denominators)
  denominators.each do |denominator|
    if numerator % denominator == 0
      next denominator
    else
      return false
      break
    end
    return true
  end
end

def find_smallest_numerator(denominators)
  if denominators.max % 10 == 0
    numerator = 2520
  else
    numerator = denominators.max
  end
  until divisible_by_all?(numerator, denominators)
    # print "\r#{numerator}"
    numerator += denominators.max
  end
  return numerator
end

numerator = find_smallest_numerator(denominators)

puts "The smallest number divisible by all numbers from"
puts "#{denominators.min} to #{denominators.max} is #{numerator}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."