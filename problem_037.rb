# The number 3797 has an interesting property. Being prime itself, it is possible
# to continuously remove digits from left to right, and remain prime at each 
# stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 
# 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to 
# right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'benchmark'
require 'prime'

def truncated_values(num)
  values = []
  digits = num.to_s.split(//)
  until digits.empty?
    values << digits.join.to_i
    digits.delete_at(0)
  end
  digits = num.to_s.split(//)
  until digits.empty?
    values << digits.join.to_i
    digits.delete_at(-1)
  end
  values.uniq
end

def truncatable_prime?(prime)
  truncated_values(prime).all? { |p| p.prime? }
end

def sum_truncatable_primes(number_truncatable_primes=11)
  p = Prime.each
  test_value = p.next

  until test_value > 7
    test_value = p.next
  end

  truncatable_primes = []
  
  until truncatable_primes.count == number_truncatable_primes
    truncatable_primes << test_value if truncatable_prime?(test_value)
    test_value = p.next
  end
  truncatable_primes.reduce(&:+)
end

if $0 == __FILE__
  puts "The sum of truncatable primes is #{sum_truncatable_primes}"
  Benchmark.bm do |x|
    x.report { sum_truncatable_primes }
  end
end