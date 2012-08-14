# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number
# 600851475143 ?

time_started = Time.now

puts "Started processing at #{Time.now}."

number_to_factorise = 600851475143

def is_prime?(number_to_test)
  # Get the obvious stuff out of the way first
  return false if number_to_test < 2 || Math.sqrt(number_to_test).integer?

  # Now the real test
  (2..Math.sqrt(number_to_test).to_i).none? { |i| number_to_test % i == 0 }
end

def factorise(number)
  prime_factors = []
  possible_prime_factor = 2
  remaining_to_factorise = number
  until remaining_to_factorise / possible_prime_factor <= 1
    if is_prime?(possible_prime_factor) && remaining_to_factorise % possible_prime_factor == 0
      prime_factors << possible_prime_factor
      remaining_to_factorise /= possible_prime_factor
    else
      possible_prime_factor += 1
    end
  end
  prime_factors << possible_prime_factor << remaining_to_factorise 
end

prime_factors = factorise(number_to_factorise)

puts "The largest prime factor of #{number_to_factorise} is: #{prime_factors.last}."

time_finished = Time.now

puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."