# By replacing the 1st digit of the 2-digit number *3, it turns out that six of 
# the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit 
# number is the first example having seven primes among the ten generated 
# numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 
# 56993. Consequently 56003, being the first member of this family, is the 
# smallest prime with this property.

# Find the smallest prime which, by replacing part of the number (not 
# necessarily adjacent digits) with the same digit, is part of an eight prime 
# value family.

require 'benchmark'
require 'prime'

def lowest_eight_prime_family
  Prime.each do |p|
    next if p < 10_000
    next unless (0..9).any? { |i| p.to_s.count(i.to_s) >= 3 }

    (0..9).each do |repeater|
      if p.to_s.count(repeater.to_s) >= 3
        hits = 1

        (repeater + 1..9).each do |test_int|
          hits += 1 if p.to_s.gsub(repeater.to_s, test_int.to_s).to_i.prime?
        end

        return p if hits >= 8
      end
    end
  end
end

if $0 == __FILE__
  puts "Lowest eight prime family: #{lowest_eight_prime_family}"

  Benchmark.bm do |x|
    x.report { lowest_eight_prime_family }
  end
end