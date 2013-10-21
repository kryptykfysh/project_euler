# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below 
# one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, 
# contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most 
# consecutive primes?

require 'benchmark'
require 'prime'

def longest_sum_of_consecutive_primes
  primes = Prime.take_while { |p| p < 10_000 }

  longest = []

  (0..(primes.count - 2)).each do |i|
    (i + (longest.size + 1)..(primes.count - 1)).each do |j|
      test_array = primes[i..j]
      sum = test_array.reduce(&:+)

      if test_array.size > longest.size && sum <= 1_000_000 && sum.prime?
        longest = test_array
      end
    end
  end
  longest.reduce(&:+)
end

if $0 == __FILE__
  puts "Prime with longest sum of consecutive primes: #{longest_sum_of_consecutive_primes}"

  Benchmark.bm do |x|
    x.report { longest_sum_of_consecutive_primes }
  end
end