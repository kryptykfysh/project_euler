time_started = Time.now

ints = 1..20
start_int = 2520
end_int = 0
count = 0

while end_int == 0

ints.each do |int|

if start_int % int > 0   	# changed from arrays to a simple count (50% improvement)
count += 1
break				# added in the break, (300% improvement)
end

end

if count == 0
end_int = start_int
else
count = 0
start_int += 20
end

end

puts end_int

time_finished = Time.now
puts "It took #{time_finished-time_started} seconds to complete."
