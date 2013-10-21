# It was proposed by Christian Goldbach that every odd composite number can be 
# written as the sum of a prime and twice a square.

# 9 = 7 + 2×1**2
# 15 = 7 + 2×2**2
# 21 = 3 + 2×3**2
# 25 = 7 + 2×3**2
# 27 = 19 + 2×2**2
# 33 = 31 + 2×1**2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a 
# prime and twice a square?

require 'benchmark'
require 'prime'
require 'set'

def double_squares
  Enumerator.new do |e|
    n = 0
    loop do
      n += 1
      e.yield 2 * n ** 2
    end
  end
end

def composite_numbers
  Enumerator.new do |e|
    n = 2
    loop do
      n += 1
      while n.prime? || n.even?
        n += 1
      end
      e.yield n
    end
  end
end

def smallest_non_golbach
  cn = composite_numbers
  cn.find do |i|
    primes = Prime.take_while { |p| p <= i }.to_set
    ds = double_squares.take_while { |n| n <= i }.to_set
    sums = primes.to_a.product(ds.to_a).map { |a, b| a + b }.to_set
    !sums.include?(i)
  end
end

if $0 == __FILE__
  puts "The smallest non-Golbach odd composite is #{smallest_non_golbach}"

  Benchmark.bm do |x|
    x.report { smallest_non_golbach }
  end
end