# We shall say that an n-digit number is pandigital if it makes use of all the 
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is 
# also prime.

# What is the largest n-digit pandigital prime that exists?

require 'prime'
require 'benchmark'

def generate_pandigitals(n)
  (1..n).to_a.permutation.to_a.map { |arr| arr.map { |e| e.to_s }.join.to_i }
end

def largest_pandigital_prime(n=9)
  number_of_digits = n
  result = nil
  until !result.nil? || n == 0
    result = generate_pandigitals(n).select { |e| e.prime? }.max
    n -= 1
  end
  return result
end

if $0 == __FILE__
  puts "Largest pandigital prime: #{largest_pandigital_prime}"

  Benchmark.bm do |x|
    x.report { largest_pandigital_prime }
  end
end