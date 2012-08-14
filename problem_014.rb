# The following iterative sequence is defined for the set of positive integers:

# n  n/2 (n is even)
# n  3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet 
# (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

time_started = Time.now
puts "Started processing at #{time_started}."

max_number = 999999

def even_function(number)
  number / 2
end

def odd_function(number)
  3 * number + 1
end

longest_chain = 0
starting_number = 0

1.upto(max_number) do |i|
  count = 1
  for_iteration = i
  until for_iteration == 1
    count += 1
    if for_iteration % 2 == 0
      for_iteration = even_function(for_iteration)
    else
      for_iteration = odd_function(for_iteration)
    end
  end
  if count > longest_chain
    longest_chain = count
    starting_number = i
  end
end

puts "The longest chain was #{longest_chain} iterations from a starting number of #{starting_number}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."
