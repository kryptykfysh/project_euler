# The series, 1**1 + 2**2 + 3**3 + ... + 10**10 = 10405071317.

# Find the last ten digits of the series, 1**1 + 2**2 + 3**3 + ... + 1000**1000.

require 'benchmark'

def last_ten_of_series(max=1_000)
  (1..max).inject(0) { |sum, i| sum + i ** i }.to_s.split(//)[-10..-1].join
end

if $0 == __FILE__
  puts "Result: #{last_ten_of_series}"

  Benchmark.bm do |x|
    x.report { last_ten_of_series }
  end
end