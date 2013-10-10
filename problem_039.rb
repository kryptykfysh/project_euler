# If p is the perimeter of a right angle triangle with integral length sides, 
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

require 'mathn'
require 'benchmark'

def most_triangle_solutions(max_p=1_000)
  max_side = (max_p / 2) - 1
  solutions = Hash.new(0)

  (1..max_side).each do |a|
    (1..max_side).each do |b|
      break if a + b >= max_p / 2
      c = Math.sqrt(a ** 2 + b ** 2)
      solutions[a + b + c] += 1 if Rational(c).denominator == 1
    end
  end

  solutions.sort { |a, b| a[1] <=> b[1] }.last[0]
end

if $0 == __FILE__
  puts "The perimeter with most solutions is #{most_triangle_solutions}"

  Benchmark.bm do |x|
    x.report { most_triangle_solutions }
  end
end