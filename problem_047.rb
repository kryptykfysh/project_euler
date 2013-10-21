# The first two consecutive numbers to have two distinct prime factors are:

# 14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19

# Find the first four consecutive integers to have four distinct prime factors. 
# What is the first of these numbers?

require 'benchmark'
require 'prime'

def next_three_have_four_prime_factors?(n)
  (n + 1..n + 3).all? { |i| has_four_prime_factors?(i) }
end

def has_four_prime_factors?(n)
  Prime.prime_division(n).count == 4
end

def first_4_by_4_prime
  n = 1
  until has_four_prime_factors?(n) && next_three_have_four_prime_factors?(n)
    n += 1
  end
  return n
end

if $0 == __FILE__
  puts "The first number of four consecutive four prime factor numbers is #{first_4_by_4_prime}"

  Benchmark.bm do |x|
    x.report { first_4_by_4_prime }
  end
end