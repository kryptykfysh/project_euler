# It can be seen that the number, 125874, and its double, 251748, contain exactly
# the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
# contain the same digits.

require 'benchmark'

def digit_array(n)
  n.to_s.split(//).map { |e| e.to_i }.sort
end

def same_digit_multiples
  n = 1

  until (2..6).all? { |multiple| digit_array(n * multiple) == digit_array(n) }
    n += 1
  end

  return n
end

if $0 == __FILE__
  puts "Lowest same digit multiple: #{same_digit_multiples}"

  Benchmark.bm do |x|
    x.report { same_digit_multiples }
  end
end