# Problem 351
# 17 September 2011

# A hexagonal orchard of order n is a triangular lattice made up of points within a regular hexagon with side n. The following is an example of a hexagonal orchard of order 5:


# Highlighted in green are the points which are hidden from the center by a point closer to it. It can be seen that for a hexagonal orchard of order 5, 30 points are hidden from the center.

# Let H(n) be the number of points hidden from the center in a hexagonal orchard of order n.

# H(5) = 30. H(10) = 138. H(1 000) = 1177848.

# Find H(100 000 000).

time_started = Time.now
puts "Started processing at #{time_started}."

n = 10

# Method of calculation involving angle calculations totally ground
# to a halt around order 400. Try again. Suspect this is a factorial
# problem

# def find_angles_in_segment(order)
#   angles = [0]
#   angle_step = 60.0 / order
#   (1..order).each do |step|
#     angles << (angle_step * step)
#   end
#   angles.pop
#   return angles
# end

# def find_hidden_trees_in_segment_of_order(n)
#   angles_in_earlier_orders = []
#   trees_blocked = 0
#   puts "Calculating for order:"
#   (1..n).each do |order|
#     print "\r#{order}"
#     angles_in_segment = find_angles_in_segment(order)
#     angles_in_segment.each do |new_angle|
#       if angles_in_earlier_orders.include?(new_angle)
#         trees_blocked += 1
#       else
#         angles_in_earlier_orders << new_angle
#       end
#     end
#   end
#   return trees_blocked
# end

# number_of_hidden_trees = find_hidden_trees_in_segment_of_order(n).to_i*6

# puts "Hidden trees: #{number_of_hidden_trees}."

def is_prime?(number_to_test)
  # Get the obvious stuff out of the way first
  return false if number_to_test == 1
  return true if number_to_test < 4
  return false if number_to_test % 2 == 0 || number_to_test % 3 == 0

  # Now the real test
  (5..Math.sqrt(number_to_test).to_i).none? { |i| number_to_test % i == 0 }
end

def array_of_primes(n)
  array_of_primes = [2]
  (3..n).each do |number|
    if is_prime?(number)
      array_of_primes << number
    end
  end
  return array_of_primes
end

def trees_hidden_in_segment_of_order(n, prime_numbers)
  total_trees_blocked = 0
  (2..n).each do |order|
    puts "Testing order: #{order}"
    trees_blocked = 0
    remaining_to_factor = order
    if prime_numbers.include?(order)
      trees_blocked = 1
    else
      test_prime_numbers = prime_numbers.clone
      iteration = 0
      until remaining_to_factor <= 1
        iteration += 1
        repeat_run = false
        until remaining_to_factor % test_prime_numbers[0] != 0
          if repeat_run == false
            repeat_run = true
          else
            iteration += 1
          end
          remaining_to_factor /= test_prime_numbers[0]
          trees_blocked += (test_prime_numbers[0]-1)*iteration
        end
        test_prime_numbers.shift    
      end
    end
    total_trees_blocked += trees_blocked
    puts "Trees blocked for order #{order}: #{trees_blocked}"
    puts "Total so far: #{total_trees_blocked}"
  end
  return total_trees_blocked
end


prime_numbers = array_of_primes(n)

hidden_trees = trees_hidden_in_segment_of_order(n, prime_numbers)*6

puts "Hidden trees: #{hidden_trees}."




time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."