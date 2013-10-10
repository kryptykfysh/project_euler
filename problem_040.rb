# An irrational decimal fraction is created by concatenating the positive 
# integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the 
# following expression.

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

require 'benchmark'

def digit_at_position(position)
  i = 1

  until position <= i.to_s.length
    position -= i.to_s.length
    i += 1
  end

  return i.to_s.split(//).map(&:to_i)[position - 1] 
end

def fractional_multiples(max_factor=6)
  (0..max_factor).inject(1) { |product, x| product * digit_at_position(10 ** x) }
end

if $0 == __FILE__
  puts "Value of digit products: #{fractional_multiples}"

  Benchmark.bm do |x|
    x.report { fractional_multiples }
  end
end