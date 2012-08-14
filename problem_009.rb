# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

time_started = Time.now
puts "Started processing at #{time_started}."

total = 1000

a = (1..total / 2).to_a.find { |a|
  (total * (total / 2 - a) % (total - a)).zero?
}

b = total * (total / 2 - a) / (total - a)

c = 1000 - a - b

puts "The triplet is #{a}, #{b}, #{c} and the product is: #{a*b*c}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."