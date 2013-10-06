# The number, 197, is called a circular prime because all rotations of the 
# digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 
# 71, 73, 79, and 97.

# How many circular primes are there below one million?

require 'prime'
require 'benchmark'

def rotations_of_number(num)
  rotations = []
  str_array = num.to_s.split('')
  str_array.length.times do |i|
    rotations << str_array.rotate(i).join.to_i
  end
  rotations
end

def is_circular?(prime)
  rotations_of_number(prime).all? { |i| Prime.prime?(i) }
end

def number_of_circular_primes(max_value=1_000_000)
  primes = Prime.take_while { |x| x < max_value }

  primes.select do |prime|
    is_circular?(prime)
  end.count
end

if $0 == __FILE__
  Benchmark.bm do |x|
    x.report { number_of_circular_primes }
  end
end