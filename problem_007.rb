# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

time_started = Time.now
puts "Started processing at #{time_started}."

desired_prime = 10001

def is_prime?(number_to_test)
  # Get the obvious stuff out of the way first
  return false if number_to_test < 2 || Math.sqrt(number_to_test).integer?

  # Now the real test
  (2..Math.sqrt(number_to_test).to_i).none? { |i| number_to_test % i == 0 }
end

def find_nth_prime_number(n)
  known_primes = [2, 3, 5, 7, 11, 13]
  search_value = 14
  until known_primes.size == n
    known_primes << search_value if is_prime?(search_value)
    search_value += 1
  end
  return known_primes
end

all_primes = find_nth_prime_number(desired_prime)

puts "The desired prime number is: #{all_primes.last}."

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."