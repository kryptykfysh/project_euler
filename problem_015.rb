# Starting in the top left corner of a 22 grid, there are 6 routes (without
# backtracking) to the bottom right corner.

# How many routes are there through a 2020 grid?

time_started = Time.now
puts "Started processing at #{time_started}."

grid_size = 20

# All paths are 38 steps in length. 19 horizontal & 19 vertical.
# Need number of combinations of 2 options, 19 of each.
# Solve using binomial coefficients. 2n!

numerator = (1..(2 * grid_size)).to_a.reduce(:*)

denominator = ((1..grid_size).to_a.reduce(:*))**2

combinations = numerator / denominator

puts "Possible combinations to reach far corner: #{combinations}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."
