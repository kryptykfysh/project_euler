# A palindromic number reads the same both ways. The largest 
# palindrome made from the product of two 2-digit numbers is 
# 9009 = 91 99.

# Find the largest palindrome made from the product of two 
# 3-digit numbers.

time_started = Time.now
puts "Started processing at #{Time.now}."

number_of_digits = 3

def find_limits(number_of_digits)
  limits = {}
  limits["lower"] = 10**(number_of_digits-1)
  limits["upper"] = (10**number_of_digits)-1
  return limits
end

def is_palindrome?(number)
  number_to_test = number.to_s
  start_string = number_to_test.slice(0, (number_to_test.length/2).to_i)
  end_string = number_to_test.reverse.slice(0, (number_to_test.length/2).to_i)
  return true if start_string == end_string
end

def find_product_palindromes(limits)
  lower_limit = limits["lower"].to_i
  upper_limit = limits["upper"].to_i
  first_factor, second_factor = upper_limit, upper_limit
  palindromes = []
  puts "Trying product values, starting with #{first_factor} and #{second_factor}."
  while first_factor != (lower_limit-1)
    while second_factor != (lower_limit-1)
      product = first_factor * second_factor
      print "\r #{first_factor} * #{second_factor} = #{product}"
      if is_palindrome?(product)
        palindromes << product 
        puts "\rProduct palindrome found: #{product}."
      end
      second_factor -= 1
    end
    first_factor -= 1
    second_factor = upper_limit
  end
  return palindromes
end

limits = find_limits(number_of_digits)
puts "Limits set to #{limits['lower']} and #{limits['upper']}."
palindromes = find_product_palindromes(limits)
puts "\nThe largest palindrome from products with #{number_of_digits} digits is: #{palindromes.max}."

time_finished = Time.now

puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."