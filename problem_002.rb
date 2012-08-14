# Each new term in the Fibonacci sequence is generated 
# by adding the previous two terms. By starting with 1 
# and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence 
# whose values do not exceed four million, find the sum 
# of the even-valued terms.

initial_values = [1, 2]
max_value = 4000000

def fibonacci(initial_values, max_value)
  values = initial_values
  until values.last > max_value
    values << (values[-1] + values[-2])
  end
  values.pop
  return values
end

def add_even_values(initial_values, values)
  even_values = []
  values.each do |value|
    even_values << value if value % 2 ==0 && value >= initial_values[0]
  end
  sum = even_values.inject(:+)
end

values = fibonacci(initial_values, max_value)

sum_of_even_values = add_even_values(initial_values, values)

puts "The sum of even values in the Fibonacci sequence is #{sum_of_even_values}."