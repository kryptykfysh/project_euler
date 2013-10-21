# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
# by 3330, is unusual in two ways: (i) each of the three terms are prime, and, 
# (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this 
# sequence?

require 'benchmark'
require 'prime'

def four_digit_prime_sequences
  result = ''

  Prime.each do |p1|
    next if [1487, 4817, 8147].include?(p1)

    p2, p3 = p1 + 3330, p1 + 6660
    next unless [p2, p3].all? { |e| e.prime? }

    permutations = p1.to_s.split(//).permutation(4).map { |s| s.join.to_i }
    next unless [p2, p3].all? { |e| permutations.include?(e) }

    result = [p1, p2, p3].inject('') { |string, e| string + e.to_s }
    break
  end

  result
end

if $0 == __FILE__
  puts "Four digit prime sequences: #{four_digit_prime_sequences}"

  Benchmark.bm do |x|
    x.report { four_digit_prime_sequences }
  end
end