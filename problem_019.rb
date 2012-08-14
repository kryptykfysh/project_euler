# Problem 19
# 14 June 2002

# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
require 'date'

time_started = Time.now
puts "Started processing at #{time_started}."

count = 0

Date.new(1901, 1, 1).upto(Date.new(2000, 12, 31)) do |day|
  if day.wday == 0 && day.mday == 1
    count += 1
    puts "#{day} was a Sunday on the #{day.mday} of the month."
  end
end

puts "#{count}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."