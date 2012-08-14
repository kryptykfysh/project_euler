# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

time_started = Time.now
puts "Started processing at #{time_started}."

max_limit = 2000000

def is_prime?(number_to_test)
  # Get the obvious stuff out of the way first
  return false if number_to_test < 2 || Math.sqrt(number_to_test).integer?

  # Now the real test
  (2..Math.sqrt(number_to_test).to_i).none? { |i| number_to_test % i == 0 }
end

def find_sum_of_primes(max_limit)
  total = [2, 3, 5, 7, 11, 13].inject(:+)
  search_value = 15
  until search_value > max_limit
    total += search_value if is_prime?(search_value)
    search_value += 2
  end
  return total
end

sum_of_primes = find_sum_of_primes(max_limit)

puts "The sum of primes under #{max_limit} is: #{sum_of_primes}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."