# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in 
# base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include 
# leading zeros.)

require 'benchmark'

def sum_palindromes(max=1_000_000)
  (1...max).inject(0) { |sum, i| sum + (i.to_s == i.to_s.reverse && i.to_s(2) == i.to_s(2).reverse ? i : 0) }
end

if $0 == __FILE__
  puts "Sum of palindromes: #{sum_palindromes}"
  Benchmark.bm do |x|
    x.report { sum_palindromes }
  end
end