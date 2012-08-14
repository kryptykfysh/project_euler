# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2**1000?

time_started = Time.now
puts "Started processing at #{time_started}."

total = (2**1000).to_s.split(//).inject(0){ |sum, i| sum + i.to_i }

# .to_s.split(/\d/)

# .reduce{ |product, i| product * i.to_i }

puts "Sum of the digits of 2^1000: #{total}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."