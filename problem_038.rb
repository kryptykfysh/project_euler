# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will 
# call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, 
# and 5, giving the pandigital, 918273645, which is the concatenated product of 
# 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the 
# concatenated product of an integer with (1,2, ... , n) where n > 1?

require 'benchmark'

def pandigitalise(i)
  test_value = []
  (1..9).each do |digit|
    test_value += (i * digit).to_s.split(//)
    if test_value.count != test_value.uniq.count || test_value.include?('0')
      return -1
    else
      return test_value.join.to_i if test_value.count == 9
    end
  end
end

def largest_pandigital
  result = 0

  (9..9876).each do |i|
    test_value = pandigitalise(i)
    result = test_value if test_value > result
  end

  return result
end

if $0 == __FILE__
  puts "The largest pandigital is: #{largest_pandigital}"
  Benchmark.bm do |x|
    x.report { largest_pandigital }
  end
end